Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA553D8128
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 04:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789705749; cv=none; b=FlnhDAHEUkri8LexFUVK3rYby8V7qVMd9BKPX9pOLwnc5nDRf79bY9qx/F3kja8fnnjugckg70Htgjlx2spYuSfUnCGAncqloWIBz6sn8snx6yBfJF3TCAZp1zvJQ0gsr43op0Mzb1b3zPZNucoFcoQHaZEPGGspaVYtsy2oalg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789705749; c=relaxed/simple;
	bh=4j95AdScqCZUqe78NadBsPLDTCF86ubLqdl/5jQITZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hO//vXEtpUIbn305ZcLmn/y40zUA3Z5wy99Te9xO8fFXeIKlybTiKLbXZM648lMDlHmwMK1mdrYbMjfC4LwQA25LKuMAubK6LAzfLOji0GoUh7Xvyb04qPJN6tzy+Iz2nJ9qMJre+X9clx/JT1ZTJTIIfSnGbXWmuFSoGjuhArI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MCiZK+C5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jv3kbSl0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MCiZK+C5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jv3kbSl0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2UhXH3492138
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 04:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vNSqr+Rk87YOsnTrOXZyhE/rjTTAgCWWWaJtccYCJRo=; b=MCiZK+C5xkpdMfCF
	pUhTzAW3gMPXzSoN1bNcB2CNWC+0CN3POeVCK2sGrjk80vVuP4l1NF9I2eEYghWy
	h2aeQcdq1Q5VWuFrOOa+5NP3fXP0Crm/7CYgSRYdasTJV0M1gP59uuvT7qDWtBzk
	BGAFVV8ayK+p9q6PvWUCbLS1OzuZ+J0XKVOkBgKAbma5bJQQ9fgtvob96/6ZIJ9z
	y2QuLDiHLbC5w4WK+MFxClYxz1tgLUGVzg0d7gj+iQfu1Rgj83Bsn1UqTdnxUKxZ
	Bw4VQdiOYjLtJxKBwGBTRXduGdJIr/QNs/YHs6uDvpjrCGiD1F/PaL6yKybF2Bt+
	RXCDmQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjkt33sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 04:29:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4b524ce78so205108a12.2
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 21:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789705746; x=1790310546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vNSqr+Rk87YOsnTrOXZyhE/rjTTAgCWWWaJtccYCJRo=;
        b=Jv3kbSl0QaY5d9aZl0A1p/vPC4oAMeuPtm0wlFQr0Tr+AYdBrWwcQ65g7ngCmEsK5V
         58ahdB8K0H69wptz6kaXXzszRXDxyCisv91Gc5VbBfTDZoHGBXbxpEhFTsodrs2r3mPk
         sH2myarg+z71+c1KfxujAyzen5gjZWPTpuX+MUBrgBJe6T+GS3d7H1EKgVOW0J4sM6TY
         Y4GSHLtKmdjuSsZovW87w/pQsNCtF5QgmxOpfeHcI7iUwq9HcgJ3ieCDubduXmeHtzPi
         64zisFDRLNEWs21M41xLxVXLdhcdTkDvvm5t9woZbCvZrXQhyP1tpd538XQKCtcfi601
         veHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789705746; x=1790310546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vNSqr+Rk87YOsnTrOXZyhE/rjTTAgCWWWaJtccYCJRo=;
        b=F/T+xZ5ZcdZqVcZ2MGrRrcQ/25YZa6cQPmNws1mwfMovFQoa1EEu/YdZo85NwVSN78
         qPB7JtSaD4C6EP6sqJDiNEmHivaXq6l78lm4QTYSbds2l/4PXWICEeIJk5BIMGfKDFFZ
         h+qNnBF/nlu6RKpmzJxJG4s/DcxIuv44KmtZSIjyv4Btfi1Vzvd5WghxzYLuU4RXkrjd
         QcQMGg0D86JsWyeAJHSo99jE69ZokdiypEccuy3OuHuXq31zGAimVB35x4oT0ix7O37j
         OoqO3jHm3jujswp/rN0Ooc9RdZ0siaB5yVhJRJUtdFVz83D65tmKxrh/kCUC5rVmTYte
         ONlA==
X-Forwarded-Encrypted: i=1; AKwUvBzdvgTJkwcBE3NTx8tBDoEDiHLt1WB25FhDoIEAqEc918xDrK2Ry5iirGoBQrpRk3kmHpEyjqM+PEfI2Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kO3F/DA3YGc1lQO8TTIA7CZ/F0O7tXGZblBCgXZ/SDQ3hlUpQt
	kXtzmg/vRSoObHg+GYRsuu8buNS1VMZXzKKIngH4duR0IyoqfZZ951sTyu6Gu/8Z2wYIgcI0BgI
	VA5+9SRxX7hcqoW201KaqhLroll763KJJLntvrrtkVLKYCK3lOhfSPGqJLPAFZICqYQ==
X-Gm-Gg: AYBFou2ykOUTPRn/YST0F/5NUbLehdkLc7vI+44zHo+n9UUMok0Pl4UAIz7zdMvcHu4
	fkgLPMOuz1PhHmvei/7A/a+gcp9g6I/6rl7Urgmn7n9wZwvk3trSeBVPKLqGHP3kduBEKdRKPOh
	KnwHxKEAS7Wnq0kGBWa6NqxbchAC4p03vb/Fgd1/mf+dti/qdm98YxJ/lHKbuMrlO9GjSbyLL/x
	ib2Rd9j/Qfs8gja3dpBjT8LuIWTCG720c/7Dg0KMcoifgyXzsjvjZRvfOc//lpWqVleZk3hXWYw
	Gor9akOu6tYoTmiFyzeScsTQ13/xv36KUN/wCs2NKc/c1T/APCFJaXxTjsqbZpX6KfoE36Z8NM0
	Kt2ICY3pl3reRK9W8UAAXD28ldMOTPPg=
X-Received: by 2002:a05:6a21:1690:b0:3da:7140:da35 with SMTP id adf61e73a8af0-3dd8c39ad61mr2809870637.15.1789705745813;
        Thu, 17 Sep 2026 21:29:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:1690:b0:3da:7140:da35 with SMTP id adf61e73a8af0-3dd8c39ad61mr2809814637.15.1789705745400;
        Thu, 17 Sep 2026 21:29:05 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c4dba322sm214595a12.10.2026.09.17.21.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:29:04 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:28:40 +0800
Subject: [PATCH 1/6] dt-bindings: media: venus,common: relax
 clock/power-domain/iommu limits for Hawi
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-add_iris_for_hawi-v1-1-ac60fd15c98b@oss.qualcomm.com>
References: <20260918-add_iris_for_hawi-v1-0-ac60fd15c98b@oss.qualcomm.com>
In-Reply-To: <20260918-add_iris_for_hawi-v1-0-ac60fd15c98b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789705735; l=1480;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=4j95AdScqCZUqe78NadBsPLDTCF86ubLqdl/5jQITZo=;
 b=UOByjBVunhomcKzMaDfypw9PHAHMVJ97wORuq+6SfPAfwq3ZcnGMRssw5XKGY9GbnrZJJitwi
 dHb46wPCYFyB9I6+6uk1TgO1HOkLJ8HUklft7dunsj1xj9os6Al9Ww2
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA1NiBTYWx0ZWRfX81taLmdljVIE
 AIG++RCn4tkMRqTL2F4qudr1Q8QxPE2M/l+zB9HqVmF1Vrmq+OKq1k9WDA7yBo2SJdpLkaExQ0D
 AXQqHKR5UmYHoWUBBUPHUa+r6klt/mBx1foDtGyy2eoPRzJxx/Uk2RPm314J+r1h2d+/N6Tq6aT
 8yZhPHdBXHZKLuOzF3AoufVMeK5rz1vpCXcoPxRWHmBw6sqjNC9kNoOwtvKMxiEy5ubc0f3Tfry
 94GO/L+2BsTFjfJ32+DoyN3kfoqGqz7Qk6UorZY0haFGbWuS9ZGieMvehOEIUVkW3J5vMrQfvKR
 NsoT69u+O63y3vSvNSXu/HBCJoxNlDKcWeaZA8d+EVz7AZHz8JG/4RRAXcdnUtYUcSXZAx1aWcj
 2d9Gi5wLxF5UGFQZqCB+gwFfBBwweF8LJkmNZu4gFxP/Fxin/Tvxjy8jWTzJALvoEqWrGdkHA8Z
 aB5Pls1vAjqutIfr08Q==
X-Proofpoint-GUID: u5Lf7m9WaO02sadJsnJnXa2e7oTsH4Oq
X-Proofpoint-ORIG-GUID: u5Lf7m9WaO02sadJsnJnXa2e7oTsH4Oq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA1NiBTYWx0ZWRfX+6cuzqSVPaBL
 Pf0EWrnlKALTjt2ToPtWKR2duPZHMzm+aDtaGybNPxNQKMRXDcHErfav+DNXGG/LLXyQ3xX3xTi
 QvkOXKnE03pipwNrGNNTTUokAUwkGco=
X-Authority-Analysis: v=2.4 cv=Y/VtIReN c=1 sm=1 tr=0 ts=6aacbe12 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HhAAYa2kYXLYgDpgJ-QA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180056

The Hawi Soc Iris5 video codec requires more clocks, power domain
entries and IOMMU mappings than the current limits allow. Relax the
common schema constraints to accommodate it.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,venus-common.yaml        | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 68d5e592a028c5eecde04ce72cd5ae6815ba5c82..18891f0859eef7e8e3739a4b94e3abcdcb9d6009 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -20,11 +20,11 @@ properties:
 
   clocks:
     minItems: 3
-    maxItems: 7
+    maxItems: 13
 
   clock-names:
     minItems: 3
-    maxItems: 7
+    maxItems: 13
 
   firmware-name:
     maxItems: 1
@@ -41,11 +41,11 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 4
+    maxItems: 9
 
   power-domain-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 9
 
   '#address-cells':
     const: 1
@@ -64,9 +64,10 @@ properties:
 
     properties:
       iommus:
-        maxItems: 1
+        minItems: 1
+        maxItems: 3
       iommu-ranges:
-        maxItems: 1
+        maxItems: 2
     required:
       - iommus
       - iommu-ranges

-- 
2.43.0

