Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB9C3FB7D3
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 01:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784597816; cv=none; b=SGUJA8BvbJqwITVI4XdsJsT4cGc3alVY5qotkJjUd+i2S3Ck1mu75bq5wV++okuLCl1hPsoYiz8GSOBzZR0THyb2BBF/EjFDsbAMwZScM073CUUBYu56MDRjEyP1OXkIfZUcrGf6i7r8WpANsRwUH2Ey2MKeHQNiPWiZkAXf/To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784597816; c=relaxed/simple;
	bh=kKZqmGf4LKS2m9V1mmfXkuR89S43SeMdCYkyZb/d0/g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NZOk+7puiasqcILINLUzMCE567oxJ/WSO8o4zdQGyIhL6OeOhCBNZWhHdEfRq1iT4ec81ehxJ25Zd8thHtxg1HMWXpwidKPmhXKo2uRnA/BfyytoiwcCuPZz06cxmNOoGVb21uYe9wGQAveBaHQXR8mmz/3UxcTQvAfu7uNIFC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A81Ty8PG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YaDOjt6d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A81Ty8PG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YaDOjt6d"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCoOl3884234
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 01:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DhlsnIb7UnbFHv29sT26Xm
	g0JbKXQwcBh97cFJ2ghF8=; b=A81Ty8PGJnZXZ2VyarouHnRPIKAuVJUspEYhnF
	4SYYJ3ulaIt8ZgSskmoA6Bz7y+WaIBAJfEgFQ0ZxSLSaeXATUflP5fE13R+k0Ljj
	6h8hqCTdNglT7zyK0A+lCxlxtAQa/Prwiv5JABBxx7txgJA0jkslK3iz4fqskxaq
	sKQobPNmUaNvZ4qs1mxRJU9OIhvuz/6PutpM4Dsy0DmuA0Lmge65CY5jj3LzVNfq
	3TpQpQfOxxpWhblc4dzD370s+X8Uvb8hENhyMFmqYElO0dJuz28G/M+x1w/PRz3W
	HQbXIQuYT/We+glV9XAuP0hfPnbtRw/Hcb3IM1OMfZiDqElA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvc9qbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 01:36:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so15550110a12.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 18:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784597813; x=1785202613; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DhlsnIb7UnbFHv29sT26Xmg0JbKXQwcBh97cFJ2ghF8=;
        b=YaDOjt6dgVwJGgOo5j0SskblILk9whtGDvBGmt0dnhESgY4ilVWA1HS3+mx/ajqTOE
         o1vaDnoRdky8S7mDhVxxOxuDMd0GHF/N7eNejPhwpctHRxy515K2a3Qs8gUCWTt0fWfL
         +17guHvhcNKFY6h4uBsCZFgJjeohgo+RJM36TnXVIMtR5J2nHSkOAW7rKsU/NFWlPi5w
         EPSfywC6P5hocpfieVY/x4Se5vImWh1hfG7PbI4I5S03ITkRbJA4zOMqXSXY5T+b8n3R
         B4rZ3CXLEE4RwToXW4WgQ05qmJ0Cv6hnlDFK7MbJcK+taWWwehbA8fEOqAzOY6AXdm0j
         JmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784597813; x=1785202613;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DhlsnIb7UnbFHv29sT26Xmg0JbKXQwcBh97cFJ2ghF8=;
        b=h3jDGWX3+mNeIBjpn5/pQuPTVDAYt7LXGgHqnkR3VXWiL+gaLD33FtdsDmWGLfJQ3V
         LIeXG0vKwKDrJ2UnlgC+N+XwGBJf3vECbz+cho5JKuVzmdNXuxc55jtAebAbt4zONh/c
         iWcYFeOVQZ7pKZYgkOT8jdGjdEIay25bowcGBjZheX9A8+evsqzlVV+wRcrchGq1NdXs
         kVHHwEJiz/CGVcBwkQ1kXmW8m8Ort6gHHv19kMYZdHTa6slxbrYjGD87nLy2odoK0GVY
         U0CwI0H7AGQXWKwar+Xl8AC31EW4MzR2Zq+ee3B5QMpx4dUX4hPv5kgSzHf0naTR4JoU
         MOHw==
X-Gm-Message-State: AOJu0YxyNkvJJg53vgUm5G00uo4tgrHx0HU3hQaAK3rWqPTvXWWMP8RQ
	x18IxklsXaIGgwWxthNXpqt5zihGePQJ2w/IxCcrDPJkeZQaeD9DXoHy2f/YRZzAI2AMtQgp4JR
	kxyeDVI6DVH/d9IWWuk4jv/K+EWBks8orXo7IIsNln4Yy7ft75eXhGyEVl6LtYJ7NXg==
X-Gm-Gg: AfdE7cklRJbZh/HM0t1uM3C79mQ7yoSTShhk5Sq+srTtbuVlk0W39ufTEGh+i3AO4Oi
	wKSdfubnZkn39huVdaciWlQCLdNMuAoufQNzbw/iQ3L26bw93SnPtExJhOkcD2BmI2cAaVyr8O+
	cZaLLwqLZZvqddXFkPk8YrZzvHXxVFSKQkDCGPZEBQTeeuUon6Yfz2VI9iuHBa6EJ5GwWYkaDV9
	XU5fUeIYod9nmwJ+fVOXu/OoqeWrPZpqAjtKNXtLVcYVjvYdTSfHl8BY9S4D+qwx6hzGtYrP2zg
	zl7ZEaoRai0j+vxBKoCvY8teGyvpydf0V2FiY9Pf/FC1QVRuQ4TMrvCdZHF0RveIevRJWnv4OyC
	mL2jJPaGDjlgGPmyzwHjWCTPXNjYiKZ+RqQ==
X-Received: by 2002:a05:6a21:a393:b0:3c3:9251:fe49 with SMTP id adf61e73a8af0-3c3ad972d5bmr17553592637.50.1784597812712;
        Mon, 20 Jul 2026 18:36:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:a393:b0:3c3:9251:fe49 with SMTP id adf61e73a8af0-3c3ad972d5bmr17553565637.50.1784597812242;
        Mon, 20 Jul 2026 18:36:52 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cd6e6esm34630487c88.13.2026.07.20.18.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 18:36:51 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH v2 0/3] media: iris: add LTR and hierarchical coding
 support for ar50lt
Date: Tue, 21 Jul 2026 07:06:22 +0530
Message-Id: <20260721-shikra_ltr_support-v2-0-702842f1f3c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABjNXmoC/32Q22rDMBBEf8XouTKyrKspJf9RQtBllahxYkeST
 UvIv9d2+lIKfVkYmD3DzB1lSBEy6qo7SjDHHIfrIuhLhdzJXI+Ao180ooQKIhuC8ymekzn0JR3
 yNI5DKphK67VhWmhO0PI4Jgjxc4O+7586T/YDXFlJP44Et2lJK08bukDOZkvrqtdnGNE4ppixS
 Zz0Bc8SEyyFCdp75psgdkPO9W0yvRsul3o5byv6F8hQR6h3gC3RErPAKVbEM+xFS4gA65XjuzO
 kK/T1kI4bwJoMeEXG0lUtc0F4ExyTjDU+WGFbLgzR3CrtWq640a1sGFp7nmIuQ/ratpybrdZ/s
 83NUohxZbmSVCgwfwqh/ePx+AYwFgfcowEAAA==
X-Change-ID: 20260710-shikra_ltr_support-27bd9a496950
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Gourav Kumar <gouravk@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784597808; l=2805;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=kKZqmGf4LKS2m9V1mmfXkuR89S43SeMdCYkyZb/d0/g=;
 b=TGQqAN79S0rH7IOmxJDFLvIx26j8oDAbQWofkqasOgKBvhEuZZNlr4LaksPJL4AD9b000FgO6
 WZcIe3K9IqICOmEvzkI55JUoz4mdUN6fYl2UsRwDO7u6bZ8VtkJszQg
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAxMyBTYWx0ZWRfX0o9CeJ5OfBYi
 4NWNR4QfLCFCENuDYrnpKKxI/TQ28yE0ar0etfB2aymab9dEDAugCeOjWibLUugTOLtanA1vDyb
 wwK50XxEuA4ne9Znj3j6TWsG/VDMW1w=
X-Proofpoint-GUID: -w8bpSJc3FUL_h_QA4AXPA8fmq7EXZQJ
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5ecd35 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=VeKIivWaU96SmrjoQJcA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: -w8bpSJc3FUL_h_QA4AXPA8fmq7EXZQJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAxMyBTYWx0ZWRfXxviSpfThCJFR
 2/bE/KBAAF0ivlvswiOrKt5+YcQXbt0N3xwQQQfa1qUgK/8Uz80XfB86CdCfBhMiLFbC4MVgGyq
 /kMG55/98envUStQVCvd6H6AAf3DmGd6WCEIZbmA3bTEsIiu6Wplc3OKGLG82hjz0Eur6IGO5Sz
 SaYTwiGswVMoSzsfejS8feh7sIwzIrR0k4cESLeJkBP7T0g/xbcGuqTPGedcnMpkuEJLiGMtT00
 cu+uT4FBklyY1ziBWuhRKSvWLvsoSOjybQ2mwfOQ+OH3hozGVzaMrn0Z3e1svQrnNuRStC8arnl
 nNNr5vIR8HFsbUigQcdG19bit3qFv7nOsINB9od3FcAJ1B/2zEJzRMGxtm4hNadjkVWMzCQlZur
 lGJsZH9U/NLmkWn1hp4NKgYp9Cg14qmNsMOt9z5kVClHX4ZngmN6+xyzbanfnZCsFgjtLDzGdiF
 cumUYSFPgZe8Pt8VT9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210013

This series adds support for Long-Term Reference (LTR), hierarchical
coding and request key frame controls for the AR50LT encoder by enabling
the required firmware capabilities in the iris driver.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v2:
- Added request key frame support
- Link to v1: https://patch.msgid.link/20260710-shikra_ltr_support-v1-0-458b587268ea@oss.qualcomm.com

To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Bryan O'Donoghue <bod@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Gourav Kumar (2):
      media: iris: add Long-Term Reference control support for ar50lt encoder
      media: iris: add hierarchical coding support for ar50lt encoder

Vishnu Reddy (1):
      media: qcom: iris: add request key frame support for ar50lt encoder

 drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 222 +++++++++++++++++++++++
 1 file changed, 222 insertions(+)
---
base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
change-id: 20260710-shikra_ltr_support-27bd9a496950
prerequisite-message-id: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
prerequisite-patch-id: 8b5a1be5778fb4c7feb069452ecb60e8b8dfc3f8
prerequisite-patch-id: e669517302297a7b315c9aa4f4189e4928091e0c
prerequisite-patch-id: 922bc325dbd9a499a3a209d2f8dbbce6a4166e60
prerequisite-patch-id: a5a49cda4e21d835558fa84f2f6bd25b8f7e72b4
prerequisite-patch-id: e62e8285bcbddade64c026379f23a8c5ae70fe52
prerequisite-patch-id: cac29b25348e2e791638a0286283109f2546f9a7
prerequisite-patch-id: 4dfaff2f9644d7a168b1b35fe947660b8f464af6
prerequisite-patch-id: a26fa49eefecf2b5ba6cf964be9327eb5ba5929a
prerequisite-patch-id: d97c79463fe1487fa7bc9eebd4cfb4610713f44a
prerequisite-patch-id: 76eafea8230160a3b5e6503c68a5c9c3c2d1497e
prerequisite-patch-id: ea9cd9a8e6561321cd9cf338a76da1382ff47e13
prerequisite-patch-id: 26e9083b709cc8f2f1184edf6b39fb89f365a9f1
prerequisite-patch-id: ce4576bd3d20880939a97a1cda9bb8678808ea65
prerequisite-patch-id: 8c94bec467b385c373bd98eb9ee5a5805fc4e6a6
prerequisite-patch-id: 6e258cd475b77927d6476704cbf91bf48a63aa0d
prerequisite-patch-id: 54c8855d0721ba8667d095e6ad6556c2021f89e9
prerequisite-patch-id: f5479d2ca6b850c0c750944a8e0b05a7df2cc5a8
prerequisite-patch-id: 96dfec1c2df69f748c1a4bd741628e946cb7bec1
prerequisite-message-id: <a2c02dce-b097-4f52-80d4-d63006ebd8c5@kernel.org>
prerequisite-patch-id: aae7aad665adb93ab0106c28420e34587ee82aba
prerequisite-patch-id: a2b7908b27a6308f9919c986f8bde5b902e5d6da

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

