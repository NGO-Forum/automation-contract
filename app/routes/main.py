# app/routes/main.py
from flask import Blueprint, redirect, url_for, render_template, flash
from flask_login import login_required, current_user
from app import db
from app.models.user import User
from app.models.department import Department
from app.models.employees import Employee
from app.models.interns import Intern
from app.models.contract import Contract  # Consultant contracts

main_bp = Blueprint("main", __name__)

@main_bp.route("/")
def index():
    if current_user.is_authenticated:
        if current_user.has_role('Admin'):
            return redirect(url_for("main.dashboard"))
        else:
            return redirect(url_for("contracts.index"))
    return redirect(url_for("auth.login"))


@main_bp.route("/dashboard")
@login_required
def dashboard():
    if not current_user.has_role('Admin'):
        return redirect(url_for("contracts.index"))

    try:
        # === REAL GLOBAL COUNTS (same logic as contracts/index.html) ===
        total_users = User.query.count()

        total_employee_contracts = Employee.query.filter(Employee.deleted_at == None).count()
        total_intern_contracts = Intern.query.filter(Intern.deleted_at == None).count()

        # Global Consultant Contracts (same as total_contracts_global in contracts.index)
        total_consultant_contracts = Contract.query.filter(Contract.deleted_at == None).count()

        # === Department Pie Chart ===
        departments = Department.query.all()
        department_data = []
        for dept in departments:
            users = User.query.filter_by(department_id=dept.id).all()
            user_count = len(users)
            managers = [u.username for u in users if u.role and u.role.name == 'Manager']
            employees = [u.username for u in users if u.role and u.role.name == 'Employee']
            department_data.append({
                'name': dept.name or 'N/A',
                'user_count': user_count,
                'managers': managers,
                'employees': employees
            })

        pie_labels = [d['name'] for d in department_data] or ['No Departments']
        pie_data = [d['user_count'] for d in department_data] or [0]

        return render_template(
            "dashboard.html",
            user=current_user,
            # Stats
            total_users=total_users,
            total_employee_contracts=total_employee_contracts,
            total_intern_contracts=total_intern_contracts,
            total_consultant_contracts=total_consultant_contracts,  # Fixed: Global count
            # Pie chart
            department_data=department_data,
            pie_labels=pie_labels,
            pie_data=pie_data
        )
    except Exception as e:
        print(f"Dashboard error: {e}")
        flash("Error loading dashboard.", "danger")
        return redirect(url_for("contracts.index"))