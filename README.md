# 🛡️ Smart Contract Security Audit – Foundry Practice

![Solidity](https://img.shields.io/badge/Solidity-0.8.x-blue)
![Foundry](https://img.shields.io/badge/Foundry-Framework-black)
![Status](https://img.shields.io/badge/Status-Educational-orange)
![Security](https://img.shields.io/badge/Security-Audit-red)

---

## 📌 Overview

This repository contains a **smart contract security audit practice** conducted as part of the:

> 🎓 *VI University Extension Course in Blockchain Technologies – University of Málaga*

The project focuses on identifying, exploiting, and understanding vulnerabilities in Solidity smart contracts related to **fund management systems**.

---

## 🎯 Scope

The audited contracts simulate real-world financial logic, including:

* 💰 Fundraising systems
* 🔁 Refund mechanisms
* 🏦 Treasury management
* 🎁 Reward redemption systems

These contracts were intentionally designed with vulnerabilities to support **hands-on auditing practice**.

---

## 🔍 Audit Methodology

The audit process was divided into two complementary phases:

### 🧠 1. Manual Review

A thorough inspection of the smart contract code to identify:

* Access control vulnerabilities
* Reentrancy risks
* Unsafe external calls
* Arithmetic issues (underflow/overflow)
* Logical flaws in business rules

---

### 🧪 2. Exploitation & Validation (Foundry)

All findings were validated using **Foundry**, by:

* Writing custom test contracts
* Simulating attacker-controlled contracts
* Reproducing real exploit scenarios

> ⚡ This ensures that vulnerabilities are not only theoretical, but **practically exploitable**.

---

## 🚨 Key Vulnerabilities Identified

### 🔴 Critical

* Reentrancy attacks → full contract drain
* Improper access control (`tx.origin`) → contract takeover
* Denial of Service (DoS) → blocked refunds
* Locked funds due to logic errors
* Unsafe external calls

### 🟠 Major

* Arithmetic underflow (via `unchecked`) → incorrect balances
* Improper function visibility → unauthorized fund transfers

---

## ⚠️ Impact Analysis

### 👤 Users

* Loss of funds (partial or total)
* Inability to withdraw assets
* Exposure to malicious contracts

---

### 🏗️ Protocol

* Loss of control over contract logic
* System instability or unexpected behavior
* Permanently locked funds
* Loss of trust and reliability

---

## 🧪 Proof of Concept (PoC)

Each vulnerability is accompanied by a **Foundry test** demonstrating:

* How the exploit is triggered
* The resulting state changes
* The financial impact

### Examples:

* 🔁 Reentrancy attacker contract draining funds
* 🎭 Malicious contract exploiting `tx.origin`
* 💣 DoS attack blocking refund loops

---

## 🛠️ Tech Stack

* **Solidity (0.8.x)**
* **Foundry (Forge & Cast)**
* Manual security analysis

---

## ✅ Security Best Practices Applied

* Checks-Effects-Interactions pattern
* Proper access control using `msg.sender`
* Validation of external calls
* Pull over push payment model
* Safe arithmetic operations
* Restricted function visibility

---

## 📚 Educational Purpose

This repository is part of a **practical learning exercise** in smart contract auditing.

The goal is to:

* Understand common vulnerabilities
* Learn how to exploit them safely
* Apply secure coding practices

---

## ⚠️ Disclaimer

> 🚨 These contracts are intentionally vulnerable and are provided **for educational purposes only**.

❌ Do NOT use this code in production
❌ Do NOT deploy in real environments

---

## 👨‍🎓 Author

**Luis Miguel Campos García**
University of Málaga

---

## ⭐ Final Note

This project reflects a **hands-on approach to smart contract security**, combining theoretical analysis with real exploit development using Foundry.

---
