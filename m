Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328773;
	b=fvrAIkcZXhQSVcMd1Rr+XQbQqQ9IUoWS19EcaMZPKMwbb8v6Fs3NGiYn1oKSja7E37MM
	 kRBbdjeGrrzVtHJTLPR11bv1nd7BTc3y0F4WCNu2P9h2+lmOmeMwjJIHT/piNfEU7XZMS
	 q/VNKjaVjr/21gR2wfd5eTvD9d9hzIXePHvAlPCRK/KiNVTXJs74JWIxUIf9Nf9p27Dq3
	 cOXW51ZhMEZu1IAZT3J/xEvStUyGa0NmYkY6p9Po4suU2q7XYaa6pGTeDM38E0AK0izF0
	 jZm4FdJ+kuzxRnNKU8wnoKKCe+5tOPviQmNM/bOlqKm4+4GCaOp/fHZrObHUPjMfPWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328773;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
	b=hvEa5GFnoKhMJ/2RQqNr0ex1x/2xIOl/n0mlnTc4X+oo+0f5aa1HiadenhMQD2wtDu6M
	 4TMUasp/iIJV/NnPwlZ3MiOVBDklKqV3cU6YnRuEdwYuzpAh3DfkkB/6YmyZVlK387im+
	 zoNBc5Cob0WRNQHVv7swQkCuTE97Mw489YjYMndfCVtZSWiShpvgQp9eucX1+rIMu6/lV
	 9MYVAf3GhqzTBW4gUcOe7CMgXglcuSnWTn420nhb2fB/yzds+EuppEhF+br7ywbZLlap/
	 hm01kgEqgaovWA4U4BFfkr6yXeS9xojLVIDV/QWJoRDgwG7WEg/AWj9zoAzedPvSpKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fQj36kj5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U7K+6cR+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C78C60A2628
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 16:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C78C60A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fQj36kj5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U7K+6cR+
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF08UQ3376618
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 16:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JJCjzDhflBD
	eCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=; b=fQj36kj5uBANLLz2D8jINo9Px7d
	yfEOpLpDeUnwbeNVsidfvZzn1oRsjnS0/X9Q6hvWo8OrgJtej1IAPSqycWRFgR13
	jekJ+2k55F+kDw4l/hGsTZKdnq0fUmnWlUrYwu2dyLqqDjV9X6uJfsHUF3QoLMeD
	fD69THgU+ODrrvmBSn/wGQBFNBpSVJjESQIq5GoyHuKUaybg84dNOSkBefDGKuJu
	3f9YU+LVKQYlteFsYuESaAi6ULvIwsYx3Z3cp0jgJWe3kvZkT4QhcQSimh8jOo3Q
	DZ5Y05lEbmN+3WcJ3BFfBMtoVGoo7ItNhdatrIWM3+NNGxJtbp8kuQCUNIQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux84a7cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 16:39:32 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc37ee6562so223258137.1
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 08:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328771; x=1794933571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
        b=U7K+6cR+Jx9hbIuWw7QAX5OWbPuBNN6oQFMCNJZDLh5ObDwNAutsekxUupyP9uYfHk
         P8JY+sIUJQOQn2Vk2POJTPnJg1znZWGlrwX1THXu/m615UUtfjYXRB/c/ziNxcUQxQ3i
         CQGx1W5ND4ErDXAEnjFnZo+lbNrbQf0Y5kVOcUmyVocUa2eWJ2+SXjp1SP4t3i5dCD/t
         FYhPtR/UTgCA9W/Itu6x5Y0MF5cQBW4ALBkiDjCgIm1c56cs+LTS28CCR/oFb7VEHzcu
         JU8WM40YwnAsRS9kejsqCSGTyPqKpOFYL8yTPqm1GZZEYeLeucfcuRVi2Oo7m49MvUpp
         gdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328771; x=1794933571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
        b=GEgjfOnM6sYjgUOtgLsExEqbKRgnJkNPl1lw+9P45oHb7/HyUTQGSmWYmagAXpRG0F
         2y8oI7UErYzvcnVOfgtfueoF8v9rJsYgz0jYPxn+l7TLlmKHEeHAhdMep5Fx2mCstZLm
         tFDAOoZ9+TQjDmRP0FeDq5Ea2ZiQUPjqVuWPrCMQZQzz5SQDzcr6dUigVjE9H3H6jbhu
         8d//JnNLtJ7PRC7xWtqu3ayyisG08PYC11nV3RKeSBhsSxS2TwFK/mA+8GO3eThe42RX
         ySmXiN/gFuTtCCMeuf3GXl2f7+rXnN/yaEOw8wOfekmfRqK809Hc/vcl8jjEHk00nb1C
         8FPA==
X-Gm-Message-State: APuU4Z8XiylMMS/BUdK2BMVXyf1mLV0XlgVhboVf0hS1rwuokCOAUGZf
	OweYNj4owLaQspd4RDb55iRxuhxAUbEvbWipyvJ/3Wc3q0/QQKNTs/yTNs85aL5UbG2ycOJW1PJ
	jVFeWa89Ax74DESRLm5Qiio1ZQo93u+V5QHZIVNFZQlupAERWGH8NcYpc9iKt6NNLwxuuISk3jq
	rq
X-Gm-Gg: AYBFou01qwLajU6W+TYBdwNsigZQ1LWmA6RRdPlYfF+g+GKIPHIcqT5RR8nPLFXLZ0z
	KeUuDgVCT4pEq7lkySGI6LVlkqDFbxttqiT3H8Oj3teNADu4ZIiVqBWTf42+5KUuDU9Na5BkDkw
	VbVelbHz+F02aZWV1E7W2CyaXGe+nnWZSxqkKT9IZBiHNiHcn/pG9xHHjyvyrPoCLPFTgCUTdIb
	YeVL0Wl5G3kI7NWLPF59EDSAJwtvR0RKSVFWBDFwzqEMV4f3UFJaUKfvN4G3h8dxZGgirsplu8n
	qBYFF/G5V2gAEcoZS47oQBPlcSNRt7D8iRAmA/4m3qj8PvhZSUNHJlAp54wl8RSxBe6IyIyFb4a
	caemjQw4RXrld/CQnwqUIL9Wqr59tHJH0o9vIaTuPwnvlXr+TNNNAJnnWvFyAOdmr3pbcQKsk9g
	==
X-Received: by 2002:a05:6102:549f:b0:7ca:e2c1:9a09 with SMTP id ada2fe7eead31-7d301be6b4dmr919138137.20.1794328771307;
        Tue, 10 Nov 2026 08:39:31 -0800 (PST)
X-Received: by 2002:a05:6102:549f:b0:7ca:e2c1:9a09 with SMTP id ada2fe7eead31-7d301be6b4dmr919118137.20.1794328770825;
        Tue, 10 Nov 2026 08:39:30 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:29 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 8/8] arm64: dts: qcom: qcs6490-rb3gen2: Enable JPEG encoder
Date: Tue, 10 Nov 2026 18:39:09 +0200
Message-Id: <20261110163909.78085-9-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX2sfFTcMuB+rD
 lyV/AqJ3UeGVeIihkCjHU0x96q/AMZOzQhAEYxFVCL/5mhYbqXyuJHrgIFlU9InIExRY8767BaU
 Fji6mNaFunVve5IWRq9MCzIMyZgAqEXwwjuhqAk0PMMZHTivYp+okrPsTy8NLGg9GEymknNrbrE
 0Cq9oQ2aZ4dHrrrFVV7woWuisMqeVRWKLeT09YA2YN+6en7I9zYAduf/zTLQ7sLJ3cj+ZMsWipU
 o5li8H52dJhaufT/jb5r41NH9tAVIcq4uBzXrvfIDsr/E27JQvl6JIIE8C2kU1Qww9+weeJOu5c
 IAXNvUFOWFECTwWn7cESQfH1Ftss4g5x39By3oJBesBnEbizlOkHDQuGGj/AGnQeWVT1IRHfAfe
 tTV/sq+rcMZWJ4HZZ4t/yS28TwwrQBENadFFzVnCGfh6t2Qjv+iVJKrryGk3Gl9Nne4X0X5WJkq
 vX/ah9d7UTWmztAX7IA==
X-Proofpoint-GUID: CAOCewFh9Bvi_A_A8tNx8_A0hE0_Se8J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX3t20uOieMYtv
 PONgDChkjRjFzqf+sBvh+GVFYofiPjmQUmgk8x19ccNYi4jN0WsTC+siCUnWxbbMJzVIbtpSWfg
 vy6vEwlgGXoQyf6AuN0Mws2qMcZ3TAU=
X-Proofpoint-ORIG-GUID: CAOCewFh9Bvi_A_A8tNx8_A0hE0_Se8J
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af348c4 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ciSP3Gwtf2YLaD0V-lgA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100066

Enable the JPEG encoder on the RB3 Gen2 board.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 909039816a216..b96214758ce13 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -789,6 +789,10 @@ redriver_usb_con_sbu: endpoint {
 	};
 };
 
+&jpeg_enc {
+	status = "okay";
+};
+
 &lpass_va_macro {
 	status = "okay";
 };
-- 
2.34.1

