Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898248;
	b=gytEYYqhm5numGdHzvTtJ0h21M26ZIDZ2Le14gy4SmLJViwCD/HSjsZnCjk03G0+G3/J
	 CQzEKd2zdTTI+ECFBh5d4Itd5hZk/AMQMsJbyqoYYA1dmIQqCI+MqKu8fS1iwjNEcjZIt
	 ipJ4Pv4wBbJ9dJaIGTE1bq08aWbRS7wK5B27QhRH5ZgK7kUrjksc+j5ObRY9fBuzsWlOs
	 WX4b7LcrZKCJjHxFohOZc7kpfcTjqScVHX+CsguBCOsb31PcJJrRmRPFuuABNkerPPpro
	 WQDMAwASX+Ky3BZBRUIwt4txSSU4Kj1qSyKc4Axz9acWx0yy6om5ncfOqVqvFcTXi2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898248;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
	b=IgiECU4aT7ik6yMjYyDFl2rqU8y+8DLqnKuEt0LkbHTXyl7jqx05Bpe6RkkC7Oq01ZuQ
	 sOOU9lyelp392CIscFZU5Vmvgl9bFkB39FOXvHVho1nt+xKEpwrPEUN0gmnFxdfwBwSq/
	 jAgLCEWOjBzYukQVCBhX0DMaBRlRDVsvBf2gKh8P4fV/hf8LTac51wT96Okw6DHM+7qqZ
	 /lt8srGrDq5Zh00/xdDWckxt0XQBCJPQ0DOuxg/C/2V0y3ZlP/Pl5z+h7UdmIkASPCHjL
	 wJmdjGesXZtCLMqbvB/FuA3/SqrPnr1BGP/AVSBcUQbqX3mVE0kYwJ9WGNxEvAd6HlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="SCzBh80/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hqnEsjiJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE8B606A31D
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBE8B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SCzBh80/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hqnEsjiJ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P16MZA4172283
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=; b=SCzBh80/mzYWZPwR
	yd9O6sltFqAZzsIQLIesE0CowOho+t5yQXE6m5mFKGspS8Fi2PZ7cm7zhyNR93br
	VVz6x5pz5LK20fiwBFKqPuyPjR9EwpBLbbng1bTWb4XFIuK1FgIoCpAjwXcksiGy
	Y4Q0gh5mcEQcYm3AmQDrlCk8zHDSrAnDQlIp60mHoX+1g6l4wwrkrqj3XtruHX+U
	sez03Wp8SqJOKLVKY5uDnZ5uTGlCHNYG10IP6hz2fDWvTDvABpKYxyToOCHDRpqq
	pH7asf69nlE9oX0TN0dBCsjGl+PUj3ZWXGcowljRlCChzU/WVGWBzlhmkMSvbY9u
	rXbO9g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgjcgtmwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so9408300eec.0
        for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 20:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898246; x=1793503046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=hqnEsjiJb2eGk6oh+WKwPWAJ+ZsyhtPjioK0Brme648BNHumSFaAQbnu3YRNRCrBgQ
         gj3CfjrS2CAPnpSSiqJ4eWPfkiEGnTKFt3FWk0bFPV2mDRfkSAr+tVqVbGjfLX2g65ap
         nPysUk07KqG9k8pEVMBOGPPZfBHLEyns1Zu85/F2Z7uMpvDp9d3alfq5Nkl+m+IPoBwg
         AvplkniiVRbq7tu643oSpXH053Y24kWa9Fu4/BbKd7lNsKaC2A5D627qOiU7BVjNpCWM
         pQXCno5WHPIZWKhK5csAaGULbjZlVJ0nSEKxYkjc37znQbqa7DGOStQPk7BXdMmFhj3x
         ULbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898246; x=1793503046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=QLFU3fk3Kgy9BLufCIw2gIcLwcf5qFKG/Yr+fKRRoKfx6ePowLbXl/uHc87mSDmsiB
         6gtq1CE2scWVDLGTNWr9i4j1OvD8dshMV2Yqm5JwdK2Y8YyY6I/63N2kVmJ61khZ6nH9
         K4INryh+Te1PeB3+NLJRKMTm7MLKzROuOyM0a1QCOclfOUZf6oLCMw82EVqviXIyUxz+
         bDcYkixbqZD7caNCExMkuj4qY8MdXbzfGwHE9QEf16HxX8TL3oxTkbu0bSAEL+YgJ1M1
         DaktRegYstVkH34jTJ+9r2BAi0HEEod57Z5vhTkT7ee3WJZ32nUpQJpn9KESYAJtSXLu
         Pntw==
X-Forwarded-Encrypted: i=1; AKwUvByHxXLYdeDqJ2Vr+jofTHiBJ/VXMnP7H4fAaZML4duhl43DTbAkcJ+5PkPMQjXd2bRvr+kwXOujt4u2vQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLMLvIasgMPpPBbe6TkM50gKUnn+xPcDmSLRJ77TD/bA6KbFxtq
	hT0Lm7V1zXoldv4cgasq1EVQfbeGs6vpVp7OEWe94rhGSFdpy/d+WMoksmMxzEL+nKKDAGyGYmN
	9TkNm0kIBiot+HQrwCb4Mo9EiYeE0ouHEIMjO8zI3jVHRpoSM8zwbVTAZtpj6LFhRuw==
X-Gm-Gg: AYBFou2doIm7YkbaI4fgK/Qk5U8iouDiQDr4Y2YJvijqpbTNTcIk91NiIHAi3kAB5hw
	RHgoe2+j01zol1PQdkglcT3voBO1bJGGN67o8JI/dGieYIKbX4uUXKVxg3uTCLIfIuJRabscJeW
	8Z0LVSiWMLIZdYdJp3vOf/HKtSjcl7siIbyX0vYSOSt5LutktIKfg+rqPuKXIcNLni42Ey9tB59
	4xg8/ejpgwX0cYr+mCzhBxEg8GdWH55rVdS0WP1GeF7ix/knJbs0gX9ycpzAqbdo6LfcDAbdCYg
	guq0JEzvg87WEVwx+16xlVj6gYjbvf4PReBVdv2ugMOVtDYqwwqy82x0foDnXTJgpwzPTClpAIq
	nZRfhjiLsdzoMX5+O9eEGyBnmt/Nkb3RR4gKXNHFdnag7H0CGB+nlEl8hm7F5XTrgwiUbiLcdZR
	MawaOZUCcrNQ==
X-Received: by 2002:a05:7301:2b06:b0:360:db68:3264 with SMTP id 5a478bee46e88-369e848b8a6mr7536793eec.6.1792898246486;
        Sat, 24 Oct 2026 20:17:26 -0700 (PDT)
X-Received: by 2002:a05:7301:2b06:b0:360:db68:3264 with SMTP id 5a478bee46e88-369e848b8a6mr7536761eec.6.1792898245931;
        Sat, 24 Oct 2026 20:17:25 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:25 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:20 -0700
Subject: [PATCH v22 01/14] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-kaanapali-camss-v22-1-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfXwBc0tT3FqDbe
 MqUzt2ikjReFCuEx/WUUP65TFosFldO9/p1HBiKEHqPeDCPtwiVgsuGHIRaj9oq5s74tlv8c08+
 oQ20b+p/BfyDRmqv+/89+bKw0PzCCAw=
X-Proofpoint-GUID: 05V6wW9z0Feb6GaG9YXpP3EiodXaijUV
X-Authority-Analysis: v=2.4 cv=JvhkP84C c=1 sm=1 tr=0 ts=6add74c7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mZPZtqNPFm0sPOGUM0AA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfXz7p1D3f2fvOP
 pbjiR8N1iVwuhU8dvv3g2E5pNE3nStKDMqFSgF3cCiUo2vUFRTj/RO7CGVfu9yxxx7DeJoNPiDy
 0gKQEDqblbUqfylrZ3YBHGXb0xs77e5YXrrEou+C0A08QxbDz4/PAqtukRyUaMHRq862vF6nO2V
 D98umFDYGPW9EsEzWsfs5g95tL7t/EEWNcuFses0b4Xhm14p352cXL67r7hv8EKeyOEapWMBkad
 avDq00FbU6k8E3vjevD2IMC6NtCX2HMNK8eUAV7JtLJULR1zoTwORDeanPNG3Dg54+RWDkQuz9i
 CSLkcdDmtvpyiGWpIjBl5LykNB2cqUFfycqBn7KgAy9s8SmRqXJP4vWczeDLbbuMPd0hvUhcZj5
 3PJ6VGBJpuvNjfm/KGmvCXqbsQdgwM1JtnmTFZZjI1oVPzdilNqZYxFV6LP5ScsXBFFCQe2d5YK
 u89s4wBd4ff6QACwyvQ==
X-Proofpoint-ORIG-GUID: 05V6wW9z0Feb6GaG9YXpP3EiodXaijUV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

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

