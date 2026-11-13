Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548049;
	b=cW5FSzqUU7j/pZd4M5M3mbq+5ViOXG9q7FallvsRsE4wQ0veWyX23LQ/KcTXBuIAJ2jc
	 XsQ7wBNB4lWAV7tThAYfeuutHl8WmZVsv4t1qq+rlSdp/RlOk4rLsNcwRmAzJLEf0Q003
	 N+R3D21q4pnIiDJ6sJeX5PYUSO4BX3kCtSz7fomKfhTxl0xJBwfjusB0FLOjAuLrpi7tr
	 65S0LmbgVlqe4xnZA+Wf86geKpC3FLgzDly9qHf6+n3VtQzyg43wnNQF7kG7ooPn+WNdW
	 w90dZBlxvRg4GOJSA/Twjqz0u1j9RfaOrNWgdEN5mN1eOvwqnvjWOryAjbkpjdbXMMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548049;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pvvqtH+Tie2c9fqwzK3zcf+slXCVv07dB1ilEfbuVpU=;
	b=x0WnZlMjdx9BBmkvaWleAa1igfh9n+CgBvV/fz9OQYiYDiMGph6ot9jpYpxyaF9QgRbq
	 SoYw40NTOuC1rm8AAwhyL92XzUEACALoztJG5SAdpq9z9/6E+jN/uzChVkjPJdHZtSSf/
	 5xDryeQDVMz73EHw1H0wOHhc3Mv6KLzRYt29U6cj/hfcXBqvpD3zT1n1uAHl/rsEqohE1
	 TCEFPRd9byVcqaMlk5uiCadPaKTTGQDto5sEBc0zp3Pz9qKRhprF7/fxy8DCMvmRQXfDH
	 3jdCjcOQ2ZwMAqDw+ggO7UMh0KWwkWdsmudFDxCL/sFG4krEMgLsygsApmHxcbQrGGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=btfDw3JW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQ10AOer;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499DD60A383E
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 499DD60A383E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=btfDw3JW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQ10AOer
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57Cqx3283518
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:34:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pvvqtH+Tie2c9fqwzK3zcf+slXCVv07dB1ilEfbuVpU=; b=btfDw3JW2Ox7IA8Z
	si602r26ZUVvjQPYIU1tKK1w343yNFumbcLZQs++bascEp/ldrfT9/RIV+KQppnZ
	54wGzfq2Lr7xwUMXYMow0toYZdEa4QSUZZcdl8pMXxI7BfgqgfUeG0rjYvF0IQ+l
	RoHZUx5G57q1wGTuggyIchGUw2Vopg4RZ4kD7Xgo7Yb425JamLduxq2W+jjzy7Sh
	xp0UC7xMC/W1qYwIJxZYNSjfMvFge4BRGxW+j0SuLdCbI+f2MPHjPqxoyuFI7CGf
	VLE8EyBlUkX2eaPwrkHf0A1Y9odyGs20yz7B2xEv3C2CrM1Z8/HBIqM5OdyuQZ9f
	/H6/ng==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37g3v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:34:08 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4ab90cdf747so2236580fac.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 21:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548047; x=1795152847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvvqtH+Tie2c9fqwzK3zcf+slXCVv07dB1ilEfbuVpU=;
        b=IQ10AOerh5tIj0Ep81h7QKiNRTgWKy1v6hIwNKDAixhVSTYEmPrL8HpscEefMP53/U
         nqIW2n78/yKi1ItBzgnoeEX7X4b+xCoiCqHaJmh4KC4XAdEO40pfrz0nwFFMnBt7Gkba
         tvkk9lBmVzEt30Crl3NxBX4AhtWX0q1rOC0R9jeryL3eRMGcbxX1cM/gxqsPOjc+TZHQ
         dGGNos/A0pRti8vqrL0CAtW0xXljmVXJm/UIpX+yMMNIItUV7RVpIuzUiPaQftnDvhnd
         m+sBXGDiZzWcrVtc8MpyfJ26f4sPbulisASgA1yhLetPxdaMdO6JTZUHwbCEJ1HqpKom
         DHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548047; x=1795152847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pvvqtH+Tie2c9fqwzK3zcf+slXCVv07dB1ilEfbuVpU=;
        b=g9a/OEA02ZtfHeYKHANVSh2FGtD2TG8PP4tgCP3VUpfHZ5GNw5GRIjlFGRSPOEOj9Q
         cMdjF7Axoxtn+NxRmJrtEw9YuhGTPiIDNRMDRihdqS7v8BCuMj40NLZgsUcRU37cLCKv
         PTUcQaVk6v9KHcfk5s1aQ7yufEQx9erJO2LX1yHg3zMHIt6jrlaxRUYNQunyB7YjTQW0
         G/FawnY4T5wylKxFBEpc40xaHJv46f/SuQ5ZKmvlrs0bTFc0VYHiem+gW3SxA3hh2QvI
         EcAoKXVzd6E9x3Pti78i1PZCBkJJ5xsxllStk3MYd2N4EIijQh3cZiQSwU03huiLWjf9
         npjA==
X-Forwarded-Encrypted: i=1; AL+hErF2S83DOECcJQHq9W8cEU4eZS2ZC27NJMfizRKVX/AoU9olV00FSt0tJmrs3WzQ9bc1snuTXDSh4eKAbg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/uKtv1cQvd8PIRMZNV27qWqj/r6vQ78jkdgBqf3fiaLzi+739s
	jCj5bfImVPwZ0kt8cWTqQcVF/37fR3NDb9VRYYRe49mJ2gF3tlT5KzX3kmOozWqA0DAFnpQmeh/
	I0tk97USoMoaznp2jz0wL7xdCxaP1G/RCw6J9o1v+D8YGAD/nVUzlQqNAPvWGmdop9Q==
X-Gm-Gg: AYBFou0kvvUyVdQX6lWdzuNO+KgZwZrJPEvOeUkpIUgGuJfaS6SDiunT7GgLsdm2dWd
	7Japfoi05E+CypeWcxMTuEsjU11z3PoGPkE2DD//hGH8tFAWJwu3t+ouf62JDi3VetmxUgh7Dy6
	ndh/SlO22p5vOKi0t546mzTAXEmtSCA3i+P9+yVZPqRgxdqE2itJvcZmNYV9MUhxYBZkiGklaFd
	KiyVLRFzCSfWISPYrdC+y/D+/WrQKaX5SuDr1TyXa0Ok2Hlh5z322DGKgc5V3ihK3wQG/6jsUSb
	qK9SRDlpT9vkVbB03bhanf2xjWdgCYAv0TtdQqDnijNeeV8yJtr+lY+de9UkVheWzT9PnICSAUq
	Ul38IoQfxR884mSciWW7bBhGTyKXrqMJOHilSpu4ROk2lxMzMMKb4h8GYltUwVvZIOjwMBq49K+
	y/hALRhyDLfRnCB7IcJIZjlK6E8a+Qq85skPHUVnbNzvA2CbacFG14ZVvOJd8x
X-Received: by 2002:a05:6870:88a1:b0:457:f4e1:a1e3 with SMTP id 586e51a60fabf-4ae63f788b7mr2812630fac.7.1794548047514;
        Thu, 12 Nov 2026 21:34:07 -0800 (PST)
X-Received: by 2002:a05:6870:88a1:b0:457:f4e1:a1e3 with SMTP id 586e51a60fabf-4ae63f788b7mr2812615fac.7.1794548047101;
        Thu, 12 Nov 2026 21:34:07 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:06 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:39 -0800
Subject: [PATCH v25 07/15] media: qcom: camss: Add PM clock definitions for
 Kaanapali
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
Message-Id: <20261112-kaanapali-camss-v25-7-1d709f57f370@oss.qualcomm.com>
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX8f9YlG1obKms
 HqFbdT9EqaMJli6ZGP1EgVjr+PlhlSqYQ0K8oQyB7TemBWNlMKFi7nroGWtIwqHO2IyVj2WN+8h
 Vdlt1R1Og/s8PUtLteCMmIsoloStAQE=
X-Proofpoint-ORIG-GUID: ECn1jNkGTf2AuqIo_0Pj9h5mqoXdPTjR
X-Proofpoint-GUID: ECn1jNkGTf2AuqIo_0Pj9h5mqoXdPTjR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX0hILPPFXVzmr
 g9ulY62A4WBUz3pFJt5ZBwg+7tNCPpQyMdQ1Fq31WEbErnvw1s+8baOJhPpt9hMz/F8uBZ6l9b0
 8OXTuyEzsJVjbhvkxs5Ct5ewuEiY9S01n61ImcgvpZDAEV26sDrKWAlhYSMMEI5S04UIe4kwcsA
 YE9CTZLAYfyN4BDNhaFHsReKmA0xNKkirpdGRlQYQ2pKltBiT+Cv5O9qpyub1T1Yf8kNpLGX0qE
 77kKjoJNbnFJJVhPCd+HeXDZErAirxqMmMOjNX9IXwyoa+Q3pIPnppeDg6GhK1UBoepJRpnzn7A
 17dBAO+qeEXsJw0cwVDC99uRjJfH67838VpaAiCEEd7pO9Q+5pHlltOLz94bYXjJb0U5uYl3MoY
 u2KyXomKe0deRLA4T0yX96uYcGIvSrIly2GZrAYFgTA3MJ6GlOmEHKvdSRo4PF+XqXZYDv5/cwd
 fSkyP7dKcTDJlggsiGw==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af6a150 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3_5DbsQPI53TjtTAKikA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130021

The CPAS AHB and AXI clocks are shared by every Kaanapali TFE and IFE
sub-block. Register them as PM clocks so the PM clock framework enables
them once when CAMSS resumes, instead of each sub-block listing them and
taking its own reference.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index cd6adf749c6f..f7b9c71cf263 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5602,6 +5602,7 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
 	.icc_res = icc_res_kaanapali,
 	.tpg_res = tpg_res_8775p,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),

-- 
2.34.1

