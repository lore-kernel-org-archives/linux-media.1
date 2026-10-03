Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59FD39A4D6
	for <linux-media@vger.kernel.org>; Sat,  3 Oct 2026 09:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018155; cv=none; b=TArNEzML9qxV8BrobsPy4Y0DhgbtdbXw4m9Mfh+BAjhTCmJyjW9IgxEIwdNoXFVHkBm5a6JkqjrpErBFzIF2aOwlQQnT8FUiGT+6T4Lcn8T867qsjXkiUdTs2jlD6ORGdOtIwsu64RCmuTfPHfH8S04VJqlovTQb9Z7QuJgPmgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018155; c=relaxed/simple;
	bh=zsqdQtklwpvdbiVBw+YVSyi6bmJpPl6N7PlUwRG4pvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qFyAf133PuwvU+dQlMR+BUrK0en8i5M49vuqPUcT8CpWg0mxBOZME52JiyZTgxLUzrgrA01hlmPBojJsNtGQkSPnexVqEHNh5RadZ3tF0NT0XX82ucMZ7nVdfODYF09Dj4pKgHGMpyybPQzidbn8fZ5i2LSWt9DXcuFP9PdWcas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogMdz9dt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfhupzPr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogMdz9dt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfhupzPr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6933Pvjh3382421
	for <linux-media@vger.kernel.org>; Sat, 3 Oct 2026 09:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=; b=ogMdz9dtnkNt9NiF
	mncBgZrkk/PbUD9dUTBN48uxQKZ0MjsE+/0BLq52kGWwc7i9SmWmQzLIkrHFfnkE
	Nk6ma7f+QHUDePJhOclAf2h1ztTTDa7MKGIzHhTf5VmLTjKW9MBTjlUx071rwrlc
	RuZC4foss+uuuRfWLTy/9T8hqGtqP2WngEbmDbulTbM+Co1/ml6oqQWWtQoWqDF+
	d1ozFkMRi8fUZ2r3llKFKziBjARrkFFbd/J001cC3Gw0umXEPpaXEfJ958jeAz7D
	brtcH9Hwyq0ZqX2hgbXh+/VfTh6e0eLgH6JwuWDy9uUMkDm2og5GozS/+X0gj1lK
	nPVFuA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssu8gus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 03 Oct 2026 09:02:31 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30f1b904861so479209eec.0
        for <linux-media@vger.kernel.org>; Sat, 03 Oct 2026 02:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791018150; x=1791622950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=dfhupzPrsz73Eq+JCKZhojCkVafMtx0PiadT88EW3BeRkoGgfJezpic5CNM0HGFFgX
         xKCuLXuZi3uF83fWs8Nw6VMTpu8t0t8j+VLWZsdD3M0/WMFXRJnu9DRkGwsTvcr2cOCR
         wmyRELkYetBnvGuODxzlL7TxqBIbMJAo4TNlehqDovx5pIW/hCfWjBQx0tlni1PpcfNs
         VV9+9j3wL3FGMdHBecuU+eV/j7QpO9ICNSwLYNXYd/EjkQTF6gz+iFAS/CgdDtvBq6bg
         aLYL7NNU42acNmh3DMVNx6snPcXbDPA3hmHkdvdltnm++IpPw6GSYMqlHNBgReJJTeVf
         P/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018150; x=1791622950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=2PX/smYe/J3Rj0ixWuqhsqEGyKUF7F+904Mcx6vcVKhV8vfivBk8tuO3az1vFsaETx
         uBGMc8+CLsJh09hcCTPCNWeGOpTlhx2RBMY8fUtnlMZVlM9uWhvT8Nk6XslNKzIQMURd
         1x67PtioKJXWHofiaomxnbvd76Fsx7v0ztcYp3JxVoNO2bclSiRqQ80l+y0TG/Dlva5X
         2JC4GDFhMdYmO/NoqgTroczx4cDebOwNZMeoLsfDX6Gb6kOMgM1tNDjLBL5BACugsLAJ
         tQmkOehR2Pi0hQUCnSPw3OQLZJB/B6PLM1CyFZo2oYzoIyC600HjkpNQsZQGAOHqzoHd
         qinA==
X-Forwarded-Encrypted: i=1; AKwUvBzC37MkGC8InIVwdhsuKdmY5Q4+hmIr2vCtSl1waERv2S22lzVCHMTzNeI1D67qFHBzGeZmeXvZoKL94A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIgrACNQUuPSpACMqt5L9jYIn1eZ5dBoz/gGoktZl9h7qG50RjW
	YmHATVYLw7FFFkmJ5wL0XhwKr5Mh/XMK9mN+M9DMJp6b5+9Ta0FnOE0Oijokm8/rIwnC8AtYaaq
	yOSooobHODcrbxzZ86njpMLXmoutTiJzMO6S2OhpUPWZ6GJlX+6pOqe8xL6asxXmwlQ==
X-Gm-Gg: AYBFou27JSIK6vwLmg409aEIWX4hiUPSNGWfsEiqfXuQ0AegVjmdo9g55C2Rb9mmEJO
	Hdd2cwtA+L7fDt8M+05nhqYSltGQo1a08nRKGae6WMM2P8aTOjV9xf6UNLggLHzjwmhluWcZop0
	nE+R+mP3j10StxMb5ZFKN6viTLAX25cgNQ/NKxpGb/yf4f60ZsHbAWo5MsEnclqETyo5Y0RngYa
	i5De8IjWaJdtXG6u35z0kDjDztpopO4VT8YNgljFwC11B+cGKas4hd8VH30G/yr+vFOfUdO/Kkv
	kFdmNFOjNzlERMKJ4wrj5ng93Rd+bfasSzcWJn+cSk6/YPQBJyjc7FteXEcotgxu22Im1L0aSQa
	2aTUGdD/2gTbU0v2c3MHOuN+1NH3wSkOw4AwcrVU+/gD8YcCueX+5o6WjiRmwwEVK/l/84L0nrg
	YQfc81VXy79A==
X-Received: by 2002:a05:7301:4909:b0:351:1d8a:2bd4 with SMTP id 5a478bee46e88-3511d8a3743mr24972eec.21.1791018150127;
        Sat, 03 Oct 2026 02:02:30 -0700 (PDT)
X-Received: by 2002:a05:7301:4909:b0:351:1d8a:2bd4 with SMTP id 5a478bee46e88-3511d8a3743mr24919eec.21.1791018149567;
        Sat, 03 Oct 2026 02:02:29 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f9f2afsm29278695eec.18.2026.10.03.02.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:02:29 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 02:02:12 -0700
Subject: [PATCH v18 01/11] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-kaanapali-camss-v18-1-87ba4ebe0db1@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
In-Reply-To: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX/FmvlJ8rF6/9
 +oivD8j7dVI23A5DOSOuqofRAG3Z+icUHiVmYqGYW4LtkUuURf6RyqR8wALQpVR5MzLzJ8z5w+I
 ZNjk+E8fDHqP4sy7yYZDVaa7AHQ63co=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX6zQYrjoXYVdB
 R29RT27bD2GBXYjIs9okDb0OfFlcK5hsnPkN9pXPAT6E+H0o/w4ZNa1bdw5jwsnd78GqH81ijp8
 wOj+5XD1MCH3Ynx42Xnm5xFvL3Jdcof07kazJYyKEPfvEhBILS4/TA0hTYCOWrtYKDLsYrkUbez
 vtx51qwoxO/j/vkiOKBFJNuEnA8Iv6A/mpPjnErq7S0FaFOmAtv5V7qZWc0eaVp7zRr8jT4Lak3
 mtPL/OLRGfRf5ZpqE5klvS2sazEEoLjXhAPG5uEM4XF2OaOaQ1H5y6kqcpG6rAZxtoQDHTOrEyl
 bHMM003JXgsks4hMM+JaYBBAT6WXrHsE9L6pgfWD2PB13F6aC6gtHdQCjgi3u5/VcxRvhd02u29
 JspfXNaTB7C3EDBb4ZyRbERSQQGIVZxwGNHR4LT/trC0v0UgBccgy38hN4RHHqNeJYnT1IP3t23
 kkSUUUDMu4v+oTLFFOg==
X-Proofpoint-GUID: u0hCIALcypr3yzdDpntHjx9kvJWDIIhr
X-Proofpoint-ORIG-GUID: u0hCIALcypr3yzdDpntHjx9kvJWDIIhr
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac0c4a7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mZPZtqNPFm0sPOGUM0AA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030035

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

