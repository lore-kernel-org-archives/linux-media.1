Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616140;
	b=0Cz/Otmuc6O1lRI9XtPmfGSH6AfIRcwA6SQ6HKD7eiVMUtwdjSArMSiyCvKva7x6f+PG
	 v9bug4yfN+EoUojzcxcd2zeHCndPE7ILaDBKBzbHELJ2OXT6BiexesxAtVNbPYxGuykDX
	 Ym1dhsaAReutMYG21qmeiJMT3v6kiLo8CdupwO+CApjTJz05cpcfgZ2yeqwVu7GIqUuC+
	 91xb4STMgzRyxeU+eEsKtqPfRyhvLM2UAZcUK5AtD17EyZGNQf/5QS/513Io/rqncyxot
	 0fWZ3JxkhKq5jHFj0LYSMy/X7k8DQhTFKSjYDRb45VyDOjqgcqBs3W7ylWajXOKGB0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616140;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
	b=QSPi4TgaNux5sgA2nvoEObtnmWYxp6u893qDnd2B6RikPDeJ6rQc10ogxIiX67SnbdM6
	 dlaZdzIl4LMvgzNcJjkvMlv3cWvljKddx/agCoI/k5ARYWazNHb+xGyuIs8sUDylYtKN2
	 X5EeoxO4Y7//WW4CjG7ORkjWRM2QILmj5cQU0vuR4FpGdB/mWgxaVY/VO07s5OxwkUVKl
	 oQd9oSqt5K5N91lQsxQVlX4CRsoOxWwNwpBCJlnLVzOSy7TFAP2aB9FO6PJadnODt3qw7
	 hXjvDEhz941YuTHEo5rlypep2JprZphXPdgwZDqtFV1vwBazkWFuaTUeW9eHXNiTbsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mvcKXKLE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kASAn+9B;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E7A606A337
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89E7A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mvcKXKLE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kASAn+9B
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AJMs2880820
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 10:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=; b=mvcKXKLEkI6U6XF8
	/MSN+QFKX4Nb3WCXOdK+nO6AwDX71ZlbEdYk0Zy38uj8lE+Q+ugEKIfECbRYZaaL
	JyeaEwQrTAsit2hNqFvx+uqXXuWCwdM+IQNofX5cjr5cS+bUsrOPAVL/n/t6S+AF
	x+FCEqL/nyXNteBDwrVByvhm09Db/BykPRj+RLbV4QT+jVWquFIp6Cc/DMiQL49Q
	VytibPYRBJPxpzR6uQikGPh0wp/ABYRmr4CWbkzDd4k4Eu/BK+DlyGcuQnU0J1cT
	V97J1bRGmcbDigaubZ6BNss3cpo8VFIwh9ZG6KrRA7AGqEnBWViPStzl33SKm45y
	qhLiKg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgdu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 10:42:18 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-54dbbf252cdso4299365b6e.2
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 02:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616138; x=1794220938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
        b=kASAn+9B0B9WwHKDoj+ar8KmE11y0wG4LbM541s7TfgQ9ZKR8bwlwv9PzD1DW3Ts/o
         FF6O1fZD2Vh5A2w5vtrPSQ6A7AsNXM0yk7l9JhCNdtxpFag2yvSskomdBhvP8hGXdqgX
         s6xUuGu59l5Shxx2UaKbr5P5nP8IS5xC7rw/20Bh6Zve1aBh5aDnjyz2fl3KujV5QN6L
         G93EJPzLNkXGdkWthXOGFOzDDKY5oCu//61LhoWNqfRZ4dpQyG93+0sVKReePJYoyWv9
         G5+2BbJGRZqJABiC/YX2r0+MyPAZsr3rej6fEbGojM0CCIo8EMkPslOaAD7/y24Yfyoq
         XdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616138; x=1794220938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
        b=rFOr6jpdf4AKJfDQCYWSO7ONupSrvaMim7TEMXUahoCdqvASI700RH3CM4JwK7qU0H
         mSMliub5DbEgGhtiBcF+KjOW9jAhpMobhhfjwv7BkR46vY3pxSAb8OL+zPn97wxnfNhT
         OjjIinFYDYVahZe0B4macRscYVerDcymoe8vXzjnqDDpNu4pJGxigPK+zlK21HT6fAQV
         ng0t3W0lS+KDLLBJ3ZFgYTgEMbxWIzYXXAHmPdrQnWyjQYY+itUNjLJNitbT7ILQ+4yp
         md1ZUNKRTf/0vSLYtKbzq4P9NkijCk0i7+Df9fhoHGbjcrEngu9TRccUdFR4beWKO6g1
         LdIg==
X-Forwarded-Encrypted: i=1; AKwUvBz2UGhGZ2adXTIpRA3gQgybqRr2pNME3VSIdoj3wgUrquve6UBBvboBr43ncG1G6JHmWZvkvvKmS8gy5Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYL/HzjQhNLaj/de02SeWFYwXYtUjy3y0g2oM0Nx/IhmfhiH7aAX
	hiXdYpHce3xzoEnXHmYxgUUjHgwRKS8q2ZuD6vBQB7jquLGLtrQ5PgzYdVz23n/Hh32QAcakcrb
	7giFlLvHmP+4KAKiLC/FAbclJhJ5EM7lp/9ATi0rFJg+Y+jnmD8qn+n8DbHLXGaVsHA==
X-Gm-Gg: AYBFou2rvMHNQXsvQghv4SjmAHexBHbv2CE0rNpCCw9XVvek7TNpYAJAVyjOIUj+JRn
	MVxVjqj1i69C70krPmBXMbacR2P0dBn2EQP5OSN5mQv8PW7gYc5znjAkuzo2S/DBhP0ZzEjOTIP
	x0UST9w3mNXag5xfW9fIivd+F4mfkkT0tOYMLE2L2wPLe9C9QXkvHAWzPwXytQiMiE2/MGtEadn
	KeWsyZ5hi/C2NODK24Nm9xM1n6OkX25KnhskGeTu4aZZil6aQuGd0w4kwWxFHmYy8ecppff1SCJ
	Uvs7IHBaKRjNbtk+OXIHxYoIseXoQi1OYEllzJ8gTgtXc1+v8MXjOVZJYA2j0MzahNCMtUQn9U4
	bv78McEVPe496c08F7QU9crQaruo2IA4SJdtBvZBy+uAj9PudK/dVa92O1o+LYkyARY3tv0JUVj
	MImWIEM6H8t0OVTx4mDiq1kL04PG0wVn7qdmaGMbdIROafG/2CygEhbwFxrl0=
X-Received: by 2002:a05:6808:1995:b0:4dd:18c7:5448 with SMTP id 5614622812f47-5640de57273mr6522649b6e.56.1793616138128;
        Mon, 02 Nov 2026 02:42:18 -0800 (PST)
X-Received: by 2002:a05:6808:1995:b0:4dd:18c7:5448 with SMTP id 5614622812f47-5640de57273mr6522644b6e.56.1793616137662;
        Mon, 02 Nov 2026 02:42:17 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:17 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:09 -0800
Subject: [PATCH v24 01/15] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
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
Message-Id: <20261102-kaanapali-camss-v24-1-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae8690a cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=quhYwmWePwexk_oO3l8A:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6CNWPbRnFl0fAGpy9Jw-qLnNOAgaFDh2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXz3GfpOiXsFx9
 K/6B3MBZoG3BeRzU0NXrdtNHXge6G3GZd5oipnwp92KJwFAwuADV1UJJuonP3ezJdaHwBcux+R6
 /xJsrJZ6oC3RWsB30VJ2v+AppfnuPBE=
X-Proofpoint-ORIG-GUID: 6CNWPbRnFl0fAGpy9Jw-qLnNOAgaFDh2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXyx4gEyZvR2DG
 k2XOGIUu1C6OoES4uMqWTkGn2SP6Qafe8i11dKxdtYESxlQM1EvmlKx3l8oEDOZOOYCSJavtAFy
 P+vxRilmKhrquZAeF2BwbryT5xJ6AcPUkgiYKC8kmIePJP3WqDqRizpRtuVGpDMcIYglBAXH0KL
 Vc3gUMK9yyY2YoxEfqs1j4KgNf6nifu79U9vaqAzxbkLHHzt8f9uvNe8nocEinJsX8dzExEYlvd
 rK+I7BGy2V1j867BNDOxDpZ7DuDWTJ59CJKb9lwrorrYdgvbnAovKmcamHNwKEKTlkFhFerZA1K
 /NC3IA431l/ZLFDI+RJHHWOT9hP3BNwQ/yYomWryGByQNqwu50TFTZxntLXTxGTIiBqjhJKAuqw
 bdHCRYws+dZe8JwkQrfMGY3x58eJE1Ohd58CAhgn1IM8dXZUoHLnTpyUZCBy8gQbMLiswYp8EFC
 DmtQtoXdH4VNSAxHdWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020042

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

