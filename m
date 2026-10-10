Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DE832B113
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 16:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648087; cv=none; b=gBIrBkEdvNbbb4kSubUuWqhq1UAmIVC+RZo7NjGNVz3a68u7oJ0xZ1tVCZwqPzWrifmqVUZwSnTKX1Vs/YIblIj+ErYP5TqUYeufOpkZs2PfJhuJQiFKlOCVuQmxM8UoEarSCexWxz1++AMSB61ppF5jB3ekK0iJBebGARmOrsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648087; c=relaxed/simple;
	bh=zsqdQtklwpvdbiVBw+YVSyi6bmJpPl6N7PlUwRG4pvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V7ItNUHLNTdFMh6HjwzdjW8hrtm3Ua7Q2AU3Gq65ly2wqvbOPM/h8SUy4jW3FkikPmUm1YsW9yKRj7CMEtfmNB2I71MPWytmx6vIZfpLJtzpgAaOypNlKUDeSwkb/Rj+xvdXr1YEVhawb0iUApe8QfLZ5ow63SEApUDLPR4+OdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iv/HU4WJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2UdMk4x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iv/HU4WJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2UdMk4x"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFPw5v641718
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 16:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=; b=Iv/HU4WJYup20Aow
	9fPv25J0ElIW3hxKoM98EjBVaFalTAepIgZEqinJnH8a51PKoNC1CqRDMouXJrc9
	jr75dKgAvnjWddj3OnCGK53w1vGvcD5uwHjSPJWqstTSAabjwaghwIKRVm0H9Y8c
	Fw03dGOzzCwT+/TD0I8rWWtZy7ASDRUuSNVhZxKRw4z2Mzck8G5mv+xO0iCiCWFG
	2XOq2DZui3Tb6jksubP6/fWPaJSDv00FQhRuxg+lQgV24iGSiEgqJ9APaNMHmbxh
	vqB5I4dPeVnlbq0qF0SLMAc7VNijCRtVrGOqrqB+CT+KtAl2ipjyZrdeMbB3SLcz
	BjYwTg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cpghere-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 16:01:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so1960065eec.1
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 09:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791648082; x=1792252882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=C2UdMk4xJh93NddLu8vcZbXxFauhvDrlHs7xsg+MG1Welv+8ZFuEwBlYDYfFfDy18G
         PqbOzHrMgkLimfYC/KWg78fvo1d0pytSzTqkBQ4hyHcvkU94gfVtc4hDoW//WqEw80rn
         +NWcn5kGAdNhwCLLtiu5OGOnlsM+l6cPCY4rQXbXtobgnnLskzzj+2XO89ePHKVLKOG0
         5Fke2YTpWpkTus2YPjmpPZjv63TJyQ11E1LXyOlkm/I3q77sjL1Y57xAJddTq6GA1NIc
         45gWmePfsehuS3HqhM5W3XEe/HEPNwUX3fEZTF2OhdRNeMb3koRyBGLomFgfA4cIHBMR
         l7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648082; x=1792252882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=wZv4PH4owm24W1yl7rTUq099a8KYQ70k0tuB7S4+Bedhnw6rhRJ/tAkjqNx6ITmggA
         EdgiCXcZuw2Y7OEpWJQ8T4FAFrVsQdfrqm9pYV1mvweeWg4wwGy6psoBkslQue7cnIen
         dfyFyRCn0d9N5IMADu930CyV/q0ykzQw/Np4gnVNS92X2bjd/L8tkqWoaCOEXye3nwCo
         XJEekPdYrauTMUFRiQDQa0ndfVm5VsXB+S2RQ0hUD7iwU379a9Jd4n141SFikGruGgHf
         yl+elxlG/3A/7918RQqBpoxSQjCG56nbW1oG508425eQ8uB+kdyFasuEhVf6ssLRGxGi
         ZN4g==
X-Forwarded-Encrypted: i=1; AKwUvBwUd4JJzVEEWMeVJf1c9/1Gw4Tl7rPY9X5tkhU1RSPOqh4TE0zUHjWiDpoCuf8r6Sy83hBsQI3uClKPKQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKs+C5Bcv0PFb/wMYe9oXvqzoKYKefs/atPHBF7QDX1O3nPsspt
	ckBH0XGGEH459KVC/xxsUz1xw41E042YJ1VOuh9bpij0EZlM6HfvD1mAoMDPtE9s/HiGIJO8ggc
	WZeeYK+rGGbX7TScNg3sgwZCkYPXE8JIh88px862xwV5nn/e63jjHimz2P5nLUgevRA==
X-Gm-Gg: AYBFou1ktbrkijTd7CRhGELck7rRQPek4eQvZr6cxpoW+/93wXK8VBC5nV5hKYvjIg1
	yA+MMonHkXVgFDmZ5Pql2VFdL0Cfk5UFX0hG3KnTScHnYK4+4TYg5KYEVbt9t5MFM6vAon6Rvb7
	LJZpi36jCULU4zbRlIQ1MMDL4W+cC8Z8bfoORdpsj5PbLdXGyPQWMhZ9DzboZ40KU70CH+QJxYm
	ckv7mRioDYO+4zPjnL2LlklfycDOERr1VYsF+Il2icUA0fYbXhfJJfr/zeAVBdhF3VdKpJjUwfI
	9O8knJocyHrPTXRJf9jk8mNQbRaSEvk9PNqAaC485wcR3YdlqplHgET0/XtQZhldtXby4WeJ4xj
	Yao/yQS8bVCyD2QR08yTSJvfwHbF50rfuiGx3HH2u3olB+AR5zBmg/WUVLcgruZwZEohC1uXdz4
	28jB0IVxfKqA==
X-Received: by 2002:a05:701b:454b:20b0:144:fa79:174 with SMTP id a92af1059eb24-16a61f45109mr6363793c88.44.1791648081995;
        Sat, 10 Oct 2026 09:01:21 -0700 (PDT)
X-Received: by 2002:a05:701b:454b:20b0:144:fa79:174 with SMTP id a92af1059eb24-16a61f45109mr6363742c88.44.1791648081353;
        Sat, 10 Oct 2026 09:01:21 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm30786022c88.13.2026.10.10.09.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:21 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 09:01:06 -0700
Subject: [PATCH v20 01/13] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-kaanapali-camss-v20-1-63e98ce9ac0c@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
In-Reply-To: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX6Fdn0u5yHS5V
 RMQ95ixd3zJUhLCB3GvT3UDPGRXCbINCf9YW7Fza8FHvnjHYGOb5daZhvy23Jmi5wuqwo6KtM8H
 rEBL3yGg15xz9/luXje7McM9+DD+2CI=
X-Authority-Analysis: v=2.4 cv=StoFe/O0 c=1 sm=1 tr=0 ts=6aca6153 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mZPZtqNPFm0sPOGUM0AA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: SirsGRKZihzr0rrmAFZcagmwWplD_9j_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX22T+9KG1uFDD
 ltuQPX6gt3lRrel9c1ZiFsgSrxjvboIYZGF7VBKSh/v1DGVH466xJRIlpACsCpjxGgYtH3VlbJw
 yAhb5+O4Wtz/wZ4Rb91kgtsUZO8wUCV0q2AKV+ZsB3SIRl780yPXnJIfqIGkmaBxwWpZaGwXTss
 8lk5k/g2s9GDkAdJQOv8hNdRvPd7ZIvyzidCp96PewacMmmUbUZWSWBN9ZuI2EKTF8VeAmnC8as
 Q0NM/gtMlUOVBLfAs9lvHSHQZ9ObDjFDw3Y4gpsVvMstG2LzRxLLg7Mo8Y27UnCz3qupLyEOOF0
 x7CZwKEMgqXyO+Gb8NyRQ1FdZN4ghOgbaVADC5iAWyFnbwsrUa92nK2aTCPfxfKGq0ZlmgJacDZ
 F396ShhQXQNRQ5qpl5QMdNCjwjj3qorIlFrVOJTx4g9XNpVcEdLQ1e0sGdXA8/duL9/k4tVouOa
 UeyprOQipx66MADSqRg==
X-Proofpoint-GUID: SirsGRKZihzr0rrmAFZcagmwWplD_9j_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100063

The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 1f1e2a4993b2..6e9eb8e265df 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -17,7 +17,9 @@ description:
 properties:
   compatible:
     oneOf:
-      - const: qcom,x1e80100-csi2-phy
+      - enum:
+          - qcom,kaanapali-csi2-phy
+          - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy

-- 
2.34.1

