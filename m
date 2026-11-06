Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973335;
	b=UGSDyqXsO0J6wy4W/vPgQ+AdS/tJnD2pUdW0hmtrs9UlatjVOhUGoFzlSxoWUZkEk1km
	 yw5FrPyOdedKpaiSrHxldeHK8ZQ0coOPXN7m8hEEk4uW1AhlA/vKnK7eM2ZHhcqNTzLLg
	 R66bzI/RUdB2VfSwRVSU631wK2Ywu6PTmot5bKI8EmB8nzbzJK1y5P3aG9t7R+Cxe2SoH
	 lZu/sOcWO1KBDSdzPijxBEND0ao3uA4dTmX41G/4vtRbMF5uKd3bPaMNNOn7ehYjCZhyV
	 heanDUygccxY/yWM5IYyS4js36JFA75m/j4562Cm/0RuOCWSaWnuFXsnKvftSUX+b6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973335;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
	b=2+lb+kbr2KOx/TZPdTum7+sBHPCkE872K31nNpgvu3o9rz4nnZ0QP0avma//3NYI9NVZ
	 cu+wYj56TS5tfxtWucBZQEdfzJKjGI22NRq4/4yWXTL3pw7f5O49a6GOQ6TxvqI55SHjW
	 so9RlTrhB4oa61pE9eD2FViTizTUDJqx09tyz5ovzxAyLpETjObGMpRyJ/VN9Wze4KENI
	 ERaLCVkfSNLKR8DKhjOa9OdVMoGzBiEkF63DxrbunQqe8rPUm7MCjEh2AU2njPjBp5Kxv
	 KHbw2cgDsBtaE6izEqpvCb3nJ2yImdPXkPONjmMXihlm22q8gnThYx9GoWeeSW1KOUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NCFwPK6f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bkjHaswQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DEC606D80D
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 13:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79DEC606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NCFwPK6f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bkjHaswQ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Doa3T4128513
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 13:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=; b=NCFwPK6fDMZUeEWu
	t2YavRajsMg7gc8nQ6+sZicIILKC65pRTJ5e3G/AePMj1kccWyxK5LcA+Ag4Xs4z
	Atqi5Fg+6AMPROVKn47l+9r4e/FzEdBz8/wU/HN+YZnPgLccTYi20HUWyobeUGXw
	dYj5mqKL07Gr6TqDIVGg9Rv7vM6mPt96fDixg+Km7/wyGSCPpeTfH0daw1pESJ2o
	oIXC7QLjczJBN29Ofw+l62rsRYvxMVgAtDUqTw8JPOUjodR/eZdbra9zUSSs8HpB
	b8gxCfbaftkWY7W5JMlHrv2oQlTVXfbazT7Mo/5oR9UMhHgXp+7EyMNyx5fnXRHD
	sJKXGw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa317g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 13:55:33 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf45382794so630413137.1
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 05:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793973333; x=1794578133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
        b=bkjHaswQTdmQfelP8tvgty8CPdkWVMxqsvNDHNIOF1ljLc02MnZaE3RMsGCmP3Y2Mw
         V/o2py+3OK5xfngJYd4b0gF68AKT7Gi4sCHaEBdhDeE90PlSsujnyozWAVoYChg+yE2S
         L1x+/Novk1mbUGdw5yN5NzNBRrlKJk1vnD+DjKN4GXwuEisMHA5yPHHhdVPwuMqJv2zS
         35ts2FidSCcedTEj50FWuBpbWV9RUCahw0fEm7aMIRZHKKzDfI5OAi13i935XnvXc6xC
         gyfoEXrVMMtqPt8t8O+iqS5PjI4FY4ebz9peSrAHU8Hj3Yh8XHSnYQCR4PICJuCn3Hvr
         wHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973333; x=1794578133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
        b=J1lJzcQz5A2383TkFF0LMUmj0YcdrLbfUH2h5uD8hni0tohS8IOGXoF6LPkoAdaSD+
         r5iX5+ThXcRAkAv1Rg4CCBrCrrus70qlI0mlfVQ7cCGv201Qg/nqHiwJoCfk32jQRLbo
         p79M5MTAxuJBrngxwmPojPCWkxFXuL+LPG4uyDDDynQuz1KyR5OBgaFYYeVDMNqv8/8T
         EO4xkKNU/jCmi5npwCv6rfdnwOZKQQkk7rsyJXG9q2TGX96bPG+SyhTCxG6NSc6FW6uo
         4GwUK8witdWAp6V7NfIjBxmMe0v7/0D5sdBQSLhWkqGwV/IAAkXq7J7Vb2QncekmYcSq
         j34w==
X-Gm-Message-State: APuU4Z8T91wLKWVOMwY/9D23WlsVkbzerX4QAhdq3B8tVSSyO8j6w7ur
	NaUzHcKeFr1G+v9C1icrOWHrYNSYbfrDh4ojGvE6h3LeTv+2d8ZC68rAssDv0SEeZu69fSKf+XS
	LDsfjL6t6ekOanE9Ag+8O45koQ04Fm+61StGRekaw6/Q0FNTExJwTEGBfOEZT2eO/1g==
X-Gm-Gg: AYBFou33MmDXgIvorlfKPYcsSyO4R5yBjKHvjXSTb2AwhhzH8mk9S4r8F4tNNmaSm/p
	nEn9t8fgqOQUOqnaQ33KGFJV5w+O/944XScYwQ18KZD3d7ZAwcYJnxblflfZjJlapce51jNQO1A
	X1vtJD3imLQjRFF3mKvnw5ZqKIH/AsqGjVS88TCda35onU1iP0sHGs2ujr5rRFY21+eRAepwAWu
	t3z/ywRk50PJOV/jF+DzFOQP99lXTJa3RVYwom5At1+cRiHbNZjXEqTgqLFa99JF058BWPJYYsp
	ZJB1emuuqyOYHq6eHXru1bpLSUOpR2chPxEHEHuvkUF9wv1hcNGOWqqggJYvHVA6DckuwFXgGNq
	TM9Ua1X+ZxXb+Wz721MLIiGcTtrwyK2AIfbzulIBuTXLZEn+uo5NYriLzM/v3EhkayWHKlDDBC4
	jyHMOhOv0qfib1vr88lQ+ec6Ki6BQFFI6oz8L5HYioO5+q+l8MSDSr4t6+rzTNagk/iT9EC2XZw
	XXz99fVS5mUa7LzkcArRR1NC12F
X-Received: by 2002:a05:6102:84c2:b0:7a8:1837:9eb9 with SMTP id ada2fe7eead31-7d2a165057bmr1093464137.27.1793973332848;
        Fri, 06 Nov 2026 05:55:32 -0800 (PST)
X-Received: by 2002:a05:6102:84c2:b0:7a8:1837:9eb9 with SMTP id ada2fe7eead31-7d2a165057bmr1093455137.27.1793973332363;
        Fri, 06 Nov 2026 05:55:32 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df2dsm3963256f8f.51.2026.11.06.05.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:55:30 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:55:19 +0100
Subject: [PATCH v14 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
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
Message-Id: <20261106-camss-isp-ope-v14-3-49c426cd2715@oss.qualcomm.com>
References: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
In-Reply-To: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: NgoPzYRUEjNCXQo6IF25M_lsFsbPoxLv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX6llcAJMITm34
 0napKzxT1gJE3Ra2WW0QqTWyCzHwmWFaC+mQcoh5EeItLk6Js+0MaZogAn9C5nW8T9qLtX5GssY
 1idUmpwPKziRh90L2FB8Ya/lePhoGws=
X-Authority-Analysis: v=2.4 cv=e7WT2qp/ c=1 sm=1 tr=0 ts=6aeddc55 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX81D6A9QMk3Cu
 XBgBzKw5Ufw/gNWauoc4WkoyqpLp9J0KlCy8oADS3c78B8vESxU4HLUptHKphLyftJWhsNdCEbS
 HpRrmqY3aT2mCbjMTSwtatP3GDDv+ViVIrLfmYTaAC6fGYd/Lu2Jmv981g/vvbM9xgl11MJJiOK
 2DypzC7i3CvO0hWHYwwmqZ1/W360U4njeOaV0+dNqxhcSatA7Im6Wvatw0xGRT9QPC/Rc7AAKNT
 C3sU0czZkiQeB0ff5H5WdsVc9iV99KyswWVIZ8zFVt2L3khBPPAeTnDj866UqxdR/bzAAPk5HSc
 XcVF5nscN2O5/z+65vWvPf1v7FrvIMLLKxvX+GmUMMcVE+GXcKhvCYVjjblAF+xkp87UumAR0Rq
 zjQBMKz8jaJhErZfi4K4uHcgxfRAgE3Dn/3D0kfBDN0IZpRAudNtXfZn8eeZsH/phIIyXJD6IEM
 I+Qx9xHJLRN7Cri4TOA==
X-Proofpoint-ORIG-GUID: NgoPzYRUEjNCXQo6IF25M_lsFsbPoxLv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060055

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..3359581bfb13e918bb4efb3bc41749e60d772ef4 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,7 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
 
   reg:
     maxItems: 6

-- 
2.34.1

