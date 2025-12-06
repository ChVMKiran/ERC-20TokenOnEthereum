# 🪙 MyToken (MTK)

## 📘 Introduction

MyToken (MTK) is an ERC-20 based cryptocurrency token created as part of a blockchain learning project.  
The goal of this project was to understand how Ethereum tokens work internally, how balances and allowances are managed, and how smart contracts behave on the Ethereum Virtual Machine (EVM).

This project demonstrates a clean and minimal ERC-20 implementation using Solidity and Remix IDE.

---

## 🔍 Token Specifications

| Field | Value |
|------|--------|
| **Token Name** | MyToken |
| **Symbol** | MTK |
| **Decimals** | 18 |
| **Total Supply** | 1,000,000 MTK |

All tokens are minted during deployment and assigned to the deployer’s wallet.

---

## 📂 Project Structure
<pre>
my-token/
├── contracts/
│ └── MyToken.sol
├── screenshots/
│ ├── compilation.png
│ ├── deployment.png
│ ├── token-info.png
│ ├── transfer-test.png
│ ├── allowance.png
│ └── approve.png
└── README.md
</pre>
---

## ⚙️ Features Implemented

- Full ERC-20 compliance  
- Minting total supply at deployment  
- Token transfers using `transfer`  
- Allowance system using `approve`  
- Delegated transfers using `transferFrom`  
- Balance tracking via `balanceOf`  
- Allowance tracking via `allowance`  
- `Transfer` and `Approval` events for transparency  

This ensures compatibility with exchanges, wallets, and Web3 tools.

---

## 🚀 How to Deploy (Remix IDE)

1. Open Remix IDE → https://remix.ethereum.org  
2. Create file: `contracts/MyToken.sol`  
3. Paste the Solidity code  
4. Select **Solidity 0.8.x** compiler  
5. Compile  
6. Go to **Deploy & Run**  
7. Environment → **Remix VM**  
8. Enter initial supply: 1000000000000000000000000
9. Click **Deploy**

Now your token is live in the local EVM instance.

---

## 📦 How to Interact With the Token

### ✔️ Check Token Balance

balanceOf(<address>)


### ✔️ Send Tokens



transfer(<recipient>, <amount>)


Example: send 1 MTK  


1000000000000000000


### ✔️ Approve Another Address



approve(<spender>, <amount>)


### ✔️ Delegated Transfer



transferFrom(<from>, <to>, <amount>)


### ✔️ Check Allowance



allowance(<owner>, <spender>)


---

## 🧪 Testing Performed

The following scenarios were tested in Remix:

- Deployment with full supply  
- Deployer balance correctness  
- Transfer from deployer → another account  
- Approving spender to use tokens  
- transferFrom executed by spender  
- Allowance correctly decreasing  
- Transfer & Approval events logged in console  

All functions behaved as expected.

---

## 🎓 What I Learned

- How ERC-20 tokens maintain balances using mappings  
- The difference between direct transfers and delegated transfers  
- The purpose of events in smart contracts  
- Why decimals are important in token representation  
- How Remix simulates blockchain interactions  
- Basics of building and deploying smart contracts  

This project strengthened my understanding of Ethereum, smart contracts, and Web3 development.

---

## 👨‍💻 Author

**Ch V M Kiran**  
B.Tech CSE (AI & ML)  
Interested in AI, and full-stack development.

---

## ✅ Conclusion

MyToken (MTK) is a fully functional ERC-20 token built from scratch.  
It meets all required standards, executes token operations correctly, and serves as a solid starting point for learning decentralized development.
