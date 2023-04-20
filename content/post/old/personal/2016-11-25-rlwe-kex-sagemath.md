---
layout: post
title: "Implementing R-LWE-KEX protocols via SageMath"
description: "Implementing (*All*) R-LWE-KEX protocols via SageMath"
date: 2016-11-25 23:16:11 -0600
categories: personal
---
**Basics of R-LWE key exchange** ([more information here](https://en.wikipedia.org/wiki/Ring_learning_with_errors_key_exchange)):

- Alice: $$e, s \leftarrow \chi \$$ $$b=as+e\$$
- Bob: $$e', s' \leftarrow \chi\$$ $$b'=as'+e'\$$

- Alice's key: $$ \to s*(as' + e') = ass' + se'\$$
- Bob's key: $$ \to s'*(as + e) = ass' + s'e\$$

As you can see, $$ \to s*(as' + e')\$$$$ \neq\$$$$s'*(as + e)\$$ but they are close considering that error is relatively small. This is why we need a reconciliation method that sends an special signal (such that message interceptor cannot use that signal to learn about the shared key) to other party.

* * *

- [**Regev method**](http://www.cims.nyu.edu/~regev/papers/lwesurvey.pdf): In 2005, Prof. Oded Regev introduced a R-LWE key exchange protocol. The reconciliation was simple did not need have any signal to be sent. Thus, there was a probability of $$\frac{1}{2^{10}}$$ that shared key did not match. This method is not practical but it was a great starting point ([implementation](https://github.com/amir734jj/LWE-KEX/blob/master/Regev.sage), [test the code](https://sagecell.sagemath.org/?z=eJytVMtu2zAQvBvwP2ydQ6jEUGK3KYo8CqQImkMvrXPJswYtrWS2EqlQUmD_fZeiHpRdpwhQH2xpd3Z2djl0pFUKOY_Rzwte5H4o8kKLRVkIJau3QGOB85iXeS64nGcqWUuVCp6ASDOlC7iqMdc15Mph-N6ib3iaJaiHg-EgFCnKnLJwASeTKVSfPQgx1oigIuh65MNBqsIyKXPCTk8-Hk8adB0eDnIRp5yyn47yZ12w6UEmPMpXYdNtD36UqhAoC4cXtJDxcDDzz28_U20nc0Zxdv2V1fSeV7dr5odIYBIakUIWGKMmBXf--cqwzPznuhO7_cnaKT04hIlXsQTrIFEFNQosT7UNjCBGiZrTmlFrpZl3OhzUO3FXBQylKuMlREpDhXQm8uAM4IVr0hggoev5DU1Er286JHZ__7C_2n8aw8nYEnnMs1zEUWoJdyyym3nzZ2vkboQdc3fPZ_9_wJb8lUFtwMrWdOYvc42BkoFIkBn1jexAYRSJwBjA2NWk_IRkNJS_cU3hh6eGz3y_8KTE-YTijc-PYOqmppR67x_DgQP44DIYMzidyZc9IbW2DX3GrTPmBLwO1p1U8ySizQ6ayxhZLX7cSPVO-yw0sM-zDGXIJk4DTHLcjTz2uua9oxiN_F9KSJbyjNHZjk2RZ2jtLb9Zco0hpJyOfQXskjK5DV383Wy27DIRZKdqALrK3LzNczRW2l1nUfYGXmxd3iZfcRqjWhUH0CM_BIfFSvmiFq2QhVr8U4bB7BZhslsSHNpDaOu79rRSW2m96g7iFreY-UJIrg1082LUgN6WK3bLafk7jf3tOKjdHVpI1YM8yraLbIsu0jg0o___AkbfcJ0bxwTLdyM3scQVo98twjFMjeMcA7tEoQKpioZvDKNHab4rktPHgp5f5W0LSHIf3p-hAv8BBadkdQ==&lang=sage)).

- **[Ding method](https://eprint.iacr.org/2012/688.pdf)**: In 2012, Prof. Ding introduced a R-LWE key exchange reconciliation method that I think it was revolutionary. For the first time, it intruded the concept of signaling (or some reconciliation information). This method generated biased key and it should not be used in a real world environment ([implementation](https://github.com/amir734jj/LWE-KEX/blob/master/Ding.sage), [test the code](https://sagecell.sagemath.org/?z=eJytVU1v1DAQvUfKfxhaIZx2m25XBUGhSKAKDlygXFoQrLzJJGtI7NRO6C6_nnGcD2-3pYDIyTsfb948e2YzrUowPMfY1Lw2cSpMrcWiqYWS7a9EY43znDfGCC7nlSrWUpWCFyDKSukazrqYt13ImYfwfoj-yMuqQB0GYZCKEqUhL5zC0XR2DPbbhRRzjQgqg7GGCYNSpU3RGIo9nj57cgRddGcOAyPykpP36aG50jWb7VUiIn9rttV24UOjaoGy9nBBC5mHwXn84uIl5Y40z8nO3r5hHXwUdeX6_iETWKSWpJA15qiJwWX8YmVRzuOrrhK7-MqGLiPYh6OoRUnWSaFqKpQ4nFYNzCBHiZqTzKi10iw6CYNOE0-qx8BQqiZfQqY0tJFeRxE8B_jBNXFMkKK7_i1MRj__6pLYp0-fH60efZnA44kDiljksAij0RIuWeaU-ddvq_OxkzvaH8_P_3-fA_hv-nUGRzulZzIfuFOKJN62hZ57ojDLRGIfg3261hUXxKXHdSnk-fylx21boDv1UumRbSCdbMvYn0R2M1FzmSM7yApFT6qfokM4jiagVSPTDVv7Rk9GuJFjzKsKKXoajV4sDP42-CiyF-wJ6Nz9rbfyaUyUTESBrXATuP5T7b7j-j7hJrAQrQg_RcV8PK_MjVJ2gM_92GizwU25LXybQAcv8MoZ--3ROUY_Ue8lYn4tkt8i7gFjV3Bg18UhzGj5POz3nD3OIr_jXeALA9eiKGiXrKBeIghjmnaBHkzj6XQax_HGHezsxN-UkKzkFaOpmIA9CCuWPRDaxPKL6KM0tzo_LrnGlPw0RCtgr8hjnOn09tF1aa8KQcP5gxcN0n7k9tfcoB3Mu_NclFtrp1sbsfe3mHbsHYs92ADfB5gNtjbT8XmtFgObhVrcy8XG3M3Eerd4eLD7LYkBY6RA6oZBjWV1D7h74H7Dt-CPOGFw3e7HW1ZShzbizhdCcr3u48cZ7Px2Pvw7_BPKjqgjPWqzdTU3SQ9pd3IaInpWtOTYdpqrOlr6Aa_oT76GnXe4NvYFJ8sHO75jiSv7-rcAJ3bywsDbcT5QqkCqusf7BfOI1GA=&lang=sage)).

- [**Peikert method**](https://eprint.iacr.org/2014/070.pdf): In 2014, Prof. Peikert introduced a R-LWE key exchange reconciliation method that used the concept of signaling similar to Prof. Ding's method but fixed the issue of biased key using randomized doubly function. This method is practical, easy to implement and it can be used in a read world environment ([implementation](https://github.com/amir734jj/LWE-KEX/blob/master/Peikert.sage), [test the code](https://sagecell.sagemath.org/?z=eJy1VkuT0zgQvrvK_6EZikKeyZjEk9nahQlVUNRy2MvucAGG2ZRjy4nAloxkw4RfT8vyQ7bj8Fg2B1es7v7665faLMuFLICXWb53nUSKDFS4pb4qwkL5MVOFZJuyYIJXb5GkBV1vw1IpFvJ1LtI9FxkLU2AG6EWt87JWeWEh_N1qvwqzPKXSdVwnZhnlCqWwgsU8WMJ9iOlWUgoigQ5fuU4m4jItFeot53_8tgDUrI9cR7FtFqLk90fqoyxIcJozD-XVsfZyH_4pRcEoLyxMkIxvXefav3r9FG07etd4Tl7-SWp4z3OdN_7VnVa69j_WQOT1v6Ql78EZLDzQnKJ9lIoCcSJIGE3jKkiaQLxJSSRokrBIm8-goFm-blw8dh20BkxdKTkAgQBOgaEXsGzAg3NTKl-GPBaZH-0Eiyi5OV_MYD6Dxe0M8tXN3A8u8d2vHsHlrYeGD3r-jDdDbEs5lSGWlUopJGmoYB2s0lwCoVyU2x0kQkKlaWXSgycAn0KJBY8oatd51zAJvv5QU5C3b28e3j3ESJB-BeQRr5edNyTRqf7pX1ORNvAukInou_9Pfn2YLfiRcBvKOWUfqCzWLXW04EhbR9BQtxpGD4sW-SlSaWCNCUpubps20E-7PVBIdAM23QksAabWIo7bmQCaKgqDdqoygZ1h9yzjPUY1yQFRPVnXpJoRmBwS7GKvs-486h8StKfLgysMoWf8CJYeILd3fQgyNrvAyMemOHADF0_HLgLPe9zHN9n2wzynPCYLKwCdwKPK80q51wt17YbtIGkkeMRSWjXCDD5_by98oPtf3AgG41OYlnS90OajFOEdNs6uTh3eoeOS2XjBGO8cDlerwTsotTEvDnFcIu7cgNi6y0r3wp8fAB1HFUxGFVhdcHBoZrBh1eR8Ybndc8oq7X-foN70aIcrXMGDjkSJ7QRbvimtngdbdNWIggFE3WeHRmBiDAYW8-NDM0XxYpri8v-i2BvWkxP_vWCcZGFOcBPMtIFXXeX6g-TVLpQ0hizEHXEH5BkKlDlaHd5MxuxZigvfhIHTFuq3taJ670zbGS2ztFejfd_IK0y91QyLU-iBn4GFYqg8F5uWyEZsvklD60yT0NIRBQv2DFr7zj1m1HWqDj8ObO45O84BdofhOp_1TTmxaGuwDna9YTyUe8uku4xrFT20dvEq0oaL4dWF3k-6pXXMTavUONLLcGxp_HQnzUWS42dwASd_0b3S3Rjt7p3Ygh29I_pDdAg408vOdazZsIFiAVwUDd5X3qO7Uw==&lang=sage)).

- [**NewHope method**](https://eprint.iacr.org/2015/1092.pdf): In 2015, Prof. Schwabe introduced a R-LWE key exchange reconciliation method that used the concept of signaling similar to Prof. Ding's method, and a generalized randomized doubly function similar to Prof. Peikert's method but faster to implement (thanks to optimizations in the implementation) and more secure by using relatively smaller modulus, hence, increasing impact of error. This method can be used in a read world environment ([implementation](https://github.com/amir734jj/LWE-KEX/blob/master/newHope.sage), [test the code](https://sagecell.sagemath.org/?z=eJytVt9v2zYQfrYA_Q-35KFU4ip20AzbmgzoULQYtgFb-tLWyARaomx2EqmSlBP3r9-R1A_ajpsN6Esgk3fffXff3TGlkjVoumKpNtTotODaKL5sDZfC_coVMyxb0VZrTkXWyGorZM1pBbxupDLwurN525m8DhD-HKzf0bqpmIqjcghYy6KtmE5LxVjmf2RcGLZiqsf-1f_8nRrDcxZH3TE3TBkpKz0F0dbN9jHUgtNaiiLLW_QVqx4xp1XeVhRT2kglheRZzqoqjuKo4DUTGknDDcxnly_gFAq2Qm4gSxjT1nHkQrQa7V7Mfvx-DmjZHcWR5qua4s0PF_qzMuTyrOEJ3rtjG-UU_mql4UyYABMUMoyj2_T6_c_oO1btFs_J2zekg0-SOPqQXj9Yo9v0cwdE3v9NBvIJnMM8Acsp3-aVNIiTQ8lZVdjwul1mYaI2S8VyKXJecWolAzSBwcRTXrOqQVHKVuTGHRashJWSbcMKYsWgy4qhFslPcTTBXmiVgC-8IWcLezlYJHdnInGlRncuuMEM-RdGnNuaVmW2YbmRCnkt5heXUOInR0NQVKwY2eGe3NlQ9D5bUs2tFH9Q7LoHsljMgSM63NzAJ2CVZjBzQJ-OAnn7a9itzfO59w55fZ0QpjbJpcJymn1WA9EkZTlWU4oMsWqSOJ2k2GA_A8Gcp-D-pGnqvhIwEshsCrP-zNVv0o1JVvnBwEC7k0J2eFhiNeV-eNesUE76xychpGowTV25riBBGTyFTmayR2UKe5EGwYtlhbRYWfLcdm0PFrTM4S02s_8gftBTZFTIOs3X0ma5wLLM76bQ3Cxm6RVWKb26S-Cs98EmwgHsZ-cp9WBgumICGxYLw5RCGEfxFMKxuQLChGxXawfqzIJxTuAlwIYqXIZOm274JyV-_69tST5-XDx7eIYZYnIOJSHJWK8PpDzkPNJ4jPj4_fIbMxyQn2Iq2P1aNvik9IzRXCBbS9wxDtrAjtDi9jbsmwQu-m3rih9cWW0tSlohZWI3BKLZB81m6aD8kXXbWON-hYURp7t7wDGabGzpsH-7xtokfgYmuDn22j3FaTZ4pANbBzEQQagDHwyMtUzgOWysrV08B057g5bictdM95OCcby3dRtyTmnTMFGQ_mBndAerfWX6B4E5TaZw_61lmfzDtrtyFLwsmWLCLhAnjX0-7qf_SaHjEk2QtFQFF9hmeN2vBcTEmjR2mzqujQ1INrhsRhoJ3I0ahyjH1fOKYWp91efJrpjB1WxHiZOT9JPkgtS0IThsU0BL32Jx9PSCdb0xPqbe7RTeraliBVrbFwjIK7zQ_ujm8W3h3V5V9kHZ0Kq1jUHtr0wzuxGO-3krvwZvDtZnf-8w7bLxLM5gB_wcAhRP5Re5HIgs5fJJGtbmOAl7e0AhgD2HwX8Mj0LEkWF18wSwb-gwzz3sESOO7tH02BbswEbYbImNp7aByzienYmd0FA8R9pz8bzG1HeLHlh9Lcxg1AfCkSCHnj7OeOIGosF_bQ2c_Ma22rZivv7uZDhdswfb3QdQU7i03d8PTghRSBDS9Ej_AqhSPww=&lang=sage)). [GitHub link](https://github.com/amir734jj/LWE-KEX).