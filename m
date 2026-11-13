Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548037;
	b=OpvWNeV2FZ90qtxEa8D+O/s1RtRcsyazfNZwqUlKPdGqraWthh45R6WULSRahCV6O4kk
	 sESeOac6kL/o20hs2ZJq8phov9+a5DmAvE9TAnXEuDcXyh4h+Sn61XaSVGROB1vWpxtwd
	 ABYi99rAcsogVqZziPO24TICEreY6P0GnFLMEBe8JcBbA2c/OKh/ygUwNp4n1e6TN0Smn
	 n08BSDNEW5fKrdO/w59KFpjJVczlmZ22rlXl5HMd61oCVuFhuEJamsxGieAiJKBHbXtIm
	 FH5DE851+YrL6QnE5UueYL//EkMI7d+I2zibuKzxl0vYb2niV2s82nNGZhD3mrjniYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548037;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
	b=eVotAOpMUOHOCE6JRJyxmlmT7G+ypCorYFvfZ4vtRc6U0LStKtluNspNAW5b6R2+jMkx
	 HyQMpoJWEhXR95zDzMLZVoG8aRAFyCkBKY3/NZIAokUxNi27z7QvMv/wvj977KjB9Rb6N
	 5VpEr7MU324/oYw4Aeuu4ifcIWVZ/FI/mX9+67fjzVGjbpE77DfzDiIRTTuJnMqhMyHoK
	 jLi7jMt4hIhPcL1evFOztQm+YRhUbzmilFzFvzSW4rDyvJvVLn8kTMi8iGYoZaM3vZi07
	 W17Ye/7IIKS+L/O9dIu7JxSbO5BOdJ4kE+8sQe8tRsieUs6FLOvtF7d74dgY32Ga5zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZNmtI40X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cb5+tIGQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98204606A335
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98204606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZNmtI40X;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cb5+tIGQ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD576MF3075835
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=; b=ZNmtI40XUta6mwHm
	mh/qAmVhftZn/DZ7DEYWNJwDVyzXJj/AIxB8PBaOfRhN+Lj0JUDUig05+bkcCgib
	splyu9LROvBf8WJOCxWFDSElg7V/34r+QfFdwUh7hXcOyXqBh38JOYJRprbyp1kf
	dgY0ANkHPVx8FTwukEAcE0x76NajKU69gr1qrkv49oVXY0eA/Vie4Z0eEtd/ZXsj
	xsJzq3hD/GGGzN4aX7/fktwgM0R0lM7t+r4U/agZ0vUAIVRe5WrYTsrYK0TylbYK
	h0O3GOHIgeTydZveFR2WJLuvmdl6purKpUuRuxYrYQhszDkHl9XdAwd4eHmDKKMm
	a+CeRw==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re4tjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:33:55 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-45e6091d8a1so385308fac.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 21:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548035; x=1795152835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
        b=cb5+tIGQJz4623R/7xz/bpHAhS9P+r6EfKAEqx0AjL54rkmhXVz8/wBoJlZvTQGIxu
         sqJ9mt4y4xmcEyk/4cXpgKKLXCMeL+Epmq+Cdltyt4ADcTJdq5f/u/byLFxsssq7kbvj
         zF7Wr92KXZlpL7vy22Ez6UlMt35XDCYHX1qHmBthbCepKK5StOZaugbAgv1YoqmU4dVF
         nPnOuFUdnRCgqRXSqdo4/Gp8HGbY3qUyc69iYGXBOrlWjvsS7PPZFRkI3z+BqV6EHswp
         YYiKwC+m1F5B0YN5mSr2CLBaGi0QA+QiVj6h24plhDjhDCWKFICwD3JZpQJBJVT5MM/T
         GpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548035; x=1795152835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
        b=mOhHW18ILA7gSRx0byBJ1HvCbTfMeSHMja0sGs+MxBpsDerkhrrjqrxzbJ7xA194h9
         OTzkrA9oSvZLD/857e89LXV+hULm4a7rkQn8F0zVTDWpn0N4agBcGrAlVhvwZnx7nLVK
         9F3Y3gFUNJMpnMDk0D+3He7a1kqyzn1KuB2jaASqDfLYIkd8I7KYxr0SyEG+qUXmgSzK
         ZgS/sa+6Gd5Ih+3WWbzHvnBE6/ukaOAuS+OSLF4A+VjAZ5LOIXw2pnrXR/qqzGUpdwFb
         nxySyYdVJ0dY7fmZxY62e07lYn3ZWD5x1MFIWZD70tu9Z/mnAAoI/a+foSy4xMTg7o3/
         mPNQ==
X-Forwarded-Encrypted: i=1; AL+hErGeWzDwwXH3/haQdQAnZEgQVM6R/RQnNjBa0f9nGd8As0mlugHVobE0O/SbBAIuVzHG3fRWVeLVAnEC6g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8cQjRDPohG4xY7ede0Nm3fDEAXRe3QBghgoxTt+swtcfBXdu23
	ZcFp3O6NzkEF1TD0msHl9irYjKEARL/G+B7EaoBYt5jQkhS4UWZIK0CUht1OTYNFk5cAwK0zJUg
	1678eadDpSvGyLxbXIdg57+ln6C/Y1I1NgJ9QILXj8MK9tu93Bcu85UJY82W8Ei+dnw==
X-Gm-Gg: AYBFou02SDybwxltmTZIrN0GhBfA5ICoqxXGv19aViBlhA+2ZOlnXCZVzKr4Sv1Tc8w
	owfbRe0M7pAF5xyRM4U0scLqZ3pHPIL8N4bP42kfjDUSmMwVflOwU4PLn/9Mtp6XI/je8mv6U47
	cIXM8EHJOww3gC3VF5EfgvlifLgTYNRH9s0decC/PnfWLaxvH0PdcK0EW5rv5ZjYBWgDe5RMDcF
	Yxuesj6GewcdfHoLtKCBiTLRdPbp4E5lObrnckb7ADjl/yjQYE2bPoLXevGiMawy7gBie+J8Gxq
	EY0rKoVeDNbfhaLbFMELstvbVUVk3Nh4cTX58lfYCR+Ri0wSEcUeZIPPiXRYrz2zVS6sqD3+s05
	DUcbThyqwJS4t07wP287YkbPt60re7lD0hv0Zl19G2TKK/iFFGZEjPTMlNBiB/u4MklRAnieVap
	6LFkdXBXE5olldjEDsuM+2BVOXZBFPbDMSb55N6Sjq4vBh2CmiSRpc91IXYmNo
X-Received: by 2002:a05:6870:1d0b:b0:4a7:4323:3fe1 with SMTP id 586e51a60fabf-4afdf49d5b7mr1423600fac.20.1794548035182;
        Thu, 12 Nov 2026 21:33:55 -0800 (PST)
X-Received: by 2002:a05:6870:1d0b:b0:4a7:4323:3fe1 with SMTP id 586e51a60fabf-4afdf49d5b7mr1423571fac.20.1794548034659;
        Thu, 12 Nov 2026 21:33:54 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:33:54 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:33 -0800
Subject: [PATCH v25 01/15] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
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
Message-Id: <20261112-kaanapali-camss-v25-1-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: RbFBgpJ7OGRhqQEujO1A8CCJdqzWLTfJ
X-Proofpoint-GUID: RbFBgpJ7OGRhqQEujO1A8CCJdqzWLTfJ
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af6a144 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=quhYwmWePwexk_oO3l8A:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfXwKGOcrOAaq84
 hVV+mx1oCfjCCPPfaPmyMw87p/iLsf1rE+OzWtR12z6oyQlMl0PAPgfGrzgpP4av67N4xtta18r
 jc0syrYjUmRuCs50A/e+eKHILLyXS0M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX5CEbQl/7xWuO
 qal1/m3MInLI0x1RSS7UWjPOavOItSPBjmMVheQRpCO848o6UMpYZ+VDtv9t03koXeaCjR9THD6
 dj/uU77+BQRG8wp1Js03dVTCRrOBAexWc5XzGFOjRFONfmMtwuygrriCmppirBDhNzUL5blDlnc
 1P652b1lqDHsuU4AoU4mXaix1N1fqMViKwYbphogZr9kOL38qBdmcIbrcg2v6wb2TKFZ6fapM9/
 vKCWiIeNfDZssXoM7aNThA0+ePntlsx0cjNdXotUADtZThe9WZVoN3M7WjRLqJglM8J68f0kVNg
 nqjWmoydUYGGwHUNLc7R+DFCYMOo2nW3NmTZkaOajhxvI5mbSOvzKX9hVhmZ1V3SGU7kCvZAoce
 9c2MjV74FN3oE8khKuMFMYlyq8uAuhnauCJJOiQxOLISdgCkV659GtHPJdd0+/OdzPNDgJuGDfU
 hN+baDLl7xxpEccPBJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

Add "qcom,kaanapali-csi2-phy" as a standalone compatible. Its common
status register offset differs from x1e80100, so it cannot fall back
to that compatible.

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

