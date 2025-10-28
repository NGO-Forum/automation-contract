from flask import Blueprint, redirect, url_for, render_template, flash
from flask_login import login_required, current_user
from app import db
from app.models.user import User
from app.models.role import Role
from app.models.department import Department

main_bp = Blueprint("main", __name__)


@main_bp.route("/")
def index():
    """Root URL – redirect based on role after login."""
    if current_user.is_authenticated:
        if current_user.has_role('Admin'):
            return redirect(url_for("main.dashboard"))
        else:
            # Manager OR Employee → go straight to contracts list
            return redirect(url_for("contracts.index"))
    return redirect(url_for("auth.login"))


@main_bp.route("/dashboard")
@login_required
def dashboard():
    """Dashboard – **only Admins** can access."""
    if not current_user.has_role('Admin'):
        flash("You do not have permission to access the dashboard.", "danger")
        # Non-admins are sent to contracts
        return redirect(url_for("contracts.index"))

    try:
        departments = Department.query.all()
        department_data = []
        for dept in departments:
            users = User.query.filter_by(department_id=dept.id).all()
            user_count = len(users)

            managers = [
                user.username for user in users
                if user.role and user.role.name == 'Manager'
            ]
            employees = [
                user.username for user in users
                if user.role and user.role.name == 'Employee'
            ]

            department_data.append({
                'name': dept.name or 'N/A',
                'user_count': user_count,
                'managers': managers,
                'employees': employees
            })

        pie_labels = [dept['name'] for dept in department_data]
        pie_data = [dept['user_count'] for dept in department_data]

        if not department_data:
            pie_labels = ['No Departments']
            pie_data = [0]

        return render_template(
            "dashboard.html",
            user=current_user,
            department_data=department_data,
            pie_labels=pie_labels,
            pie_data=pie_data
        )
    except Exception as e:
        print(f"Dashboard error: {str(e)}")
        flash("An error occurred while loading the dashboard.", "danger")
        return redirect(url_for("contracts.index"))