Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953541;
	b=IMz3lLftIjnz3TfppQvcRWoSaidmXIRHIY7IRT5iINhFklkpXsqDewBHfXF4fNdt2MF3
	 OWuWMx2kOljKoaOdMcef+Q+j+GdaRoouGX9XHTRRYxYkKnRkqFuUOu1Z92zHFtlVUV0I+
	 IXn/ZreAwfLbJniS5lpXN/w2dpAx0jqclrsdz7rN7BnFNQxM4AnqtyZHx3e2fqDM57KZj
	 QUm4H2QbVxNHgIXDGCFpfD35jY2tID4RkmcZp30FbVyfSamB9t5NA7qoe6cHeDjo1mzrs
	 x1TMaV+OfyEu2ctVF/RK85Q1wKLzbRcPD2MN0Gks01tN8OmgTo/oGUOFnmBtgH+p2jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953541;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
	b=3W01ytfo0T24fjH0ewfTbXiIw5fWQbA2CAfrzmzgFzYCZcQJMOwFK+8Dz/LmSQAlJ5to
	 pB1WGV7uYN11yJ+fXzDK0l0KkO5AlqXqxUWLVN6M+bdW4e3gChFZ+WVDF6J6Pmm2b4ZFf
	 qh3zHc/APwJf1cf0umYXYOye35+E85ZqxlH0aXYnBmgIw95m0+nfonhYWf9EdbuZkqEDy
	 FNLA+bTIyZb8++KL5T31n1QI/QIFTUEdG01MLzjygRyDP00847kssW+ueuoZr7lSizrwE
	 zW+529abYJDS8P2zMXSrETIo+xUWVZVjb64ym3Z8lC1GfvonjBaGSQ/ZJjGk2mvCxMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nb4dBQpc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zvx9t0t3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46629606A329
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 08:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46629606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nb4dBQpc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zvx9t0t3
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RPA43906910
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 08:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xtBrngpMGCe
	Q6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=; b=nb4dBQpcclDhdFZH0+sibeHUTGO
	TQqHVBm1saZQDojMKIWH5sg7pqbDZBmpqp4G3nu58L2s0l3r9nn/w8lZgu8wZ6ci
	9olI2LL6MDGIsy5VtkAtShcbh6T/eHFWdSx3gyYiszIOG/eL4Bb9fb8KPAmcbB1m
	jwigN+hiNKyFtOpczbHyANviKXFFHr4s3e6da207ft4B/1WE6+fzc6Bko29jfFOc
	kwvGfsYng+CwsxhOfzlnKZaz8gzEE3US68zmEnPy8QFc8KVqDBF/yxcePFzNXVTT
	BBWY8lLRiReV1U5LYv1ohK4gIhuPn+f5yvh135MVXj5jJDmIZCGquz2Pr3A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pasu0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 08:25:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f37c94ceeso286218885a.1
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 00:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953540; x=1794558340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
        b=Zvx9t0t3INy99PSqbz8YgF19vLw60ALAmtA2ESpaHKS29oDotfcMcNPL6IfYK5CIRr
         g3ITS2ckuXPDS7Q/EDTHkfppKoJkoYCNeS/9h1/vzvvzhFbcNmzp1HkgaHamUloMtQED
         BRgCaNAQyWDbQPgM9Paxwmm/I1MwzzLeFHJxY4q1dfLfkEG1qZ9qIpySEksGaVu4etLW
         82jVNB00K/a3Cffw7C+ATyaJ0Rj9UFWDj+R0/LnCwRbqU/Poj1D7DRmVtfNNLfB+xfGx
         8BNOnqwGI+oelKpZE4/gW7P1eeKMLdvJogR1FRf9vGIuEVln3eck9m0kdLdwRboEt/IF
         H1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953540; x=1794558340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
        b=Q+Hn/BUUTCcEwTtImW++MnosTkZC7YGEm63tbXly/0Gt0P5+Qcn1le8tEs5J3wGA5C
         h+isGVLQrDm3Z+OVImrXTshw/PbexLYqnIsQML2rLiqQzPMnyGFgRcmc1mTwUrDuPOiv
         0sQEJhStEuy0pjxNCbwuADUz9rENHjULEzean47LVFFNP3Ut7pVc7c6zG1WAV37EMPjM
         GS/CIyzOjUzwzpGJASxbfnmZNR8NahVZJIdrpi7xiOi5h3EJkMcryG64A5PCmYBbvAXc
         PEyXw80LaBEOn3azyz9Mlp9MTWAumOxS5TXZZfbetyJ2cSZygutpzq22TFtU08XUZo+u
         kX3A==
X-Gm-Message-State: APuU4Z/V+lNO9WymIde7IyLZiWjfWLNjcPWRZF4xyuM2y0OiLt1iqRP/
	q3licqp2hUWxcOChfTysqbAYvddiqg7ceGnDacXVK3SeVE/+aCf0ly9kvK1FxyOS9/jZescXi1s
	Hgc7K3Tsz14+lE1d+rPM1cpnF+SPZNjkSToWGzrHtu7oLM8b/A4OQ11/DElraLNVxW4tpV4w8q1
	Gw
X-Gm-Gg: AYBFou28nes9iuXXwiGLfJ+UGycPeyTHTkM1HQYj0ifpccwCpLcgNVj4LoyJEeYxal/
	ym9AaTuO2ccAnomFo6l3Tgek3JYHldV346BjrVdM+cbieuC3A5idY4rBTBbunvCPpk8uy1I/OJb
	ufn1vWAWPkyWw3qWIviXTJLLs2B17jeIYDUU1X/y6RPcz4O1Y92HicXKfZk7opMN0TCFVwWdu/S
	V8MxF6VtW8mv7n/CxTzakUHAhFcRIq+8cMTJT2+GpDt1bY7wPsJ/lgVPHZWRLdi/0fte3BL2Ym8
	C2OZoexOuR/Tk4X5Jx/OA6RO1W2lMGhxmXTj4h6X4BBnhXktjkQxOXht4RkHIhJeI9G1dUMnJsH
	PprJZcwc2JWKIfwP8AJE9KlFj9H7rO8KmNsvuj5QsgJWawKkaz32yCtgwsQ40wgr6ZPxXU9O15Q
	==
X-Received: by 2002:a05:620a:4407:b0:93e:5677:317b with SMTP id af79cd13be357-945e174b3e7mr852292885a.25.1793953539837;
        Fri, 06 Nov 2026 00:25:39 -0800 (PST)
X-Received: by 2002:a05:620a:4407:b0:93e:5677:317b with SMTP id af79cd13be357-945e174b3e7mr852290585a.25.1793953539438;
        Fri, 06 Nov 2026 00:25:39 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm130723255e9.0.2026.11.06.00.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:25:38 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v7 6/8] arm64: dts: qcom: qrb5165-rb5: Enable JPEG encoder
Date: Fri,  6 Nov 2026 10:25:20 +0200
Message-Id: <20261106082522.1448390-7-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX8Sl5FOlgo1xD
 vglzyEdDWBR/dMYa0fnOeFpR+qEdBD5PG9MHkWaGudciShXcuzYTLDPat5a5vGcYmkLiw3nTDcX
 k5ACUgHpi3+yDg6DprulRWBA+zHoo8sOVcjWNtHmFYeS3Lm9XffaTsEvC4DOi+aRh/MVHBYiQzf
 HdYIqtFHONI5gJvt/HP+EvxyPkkvDoF7/+Bg1L+o7Ez8Xs2iD78XMEA/hMA/l/oY4H7WVG8ASSB
 CipN6k8PzclTHRacYqSLoXVvePw+rYVs6VeFVjEAOlpl9m1VZQZFBbBEaj6k2n+E4PqG3oG1PA1
 14JBBSZYYnXV9D3k5ATctQcRFXIUg/1f/ViKGlw/Z/7d34I0Z0zv//BdbALcGVkUmLq7aQdF3Qo
 p4XhhbfUx9YO+U2lswszBhTPZoj7yYCumLQyXugcN/B6YnPsnAdlU2fVMLbZjolqkdR0FhJBKkt
 /VqEuRdr2VnLbEyE9CA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX5nBNTqpLoLoX
 3P32iw5jEpJtracaw1elR6Ynye41SLDQJqV8gNoMwKkWtyJNmGA0oespy13XoPr/E2w7noWgIs8
 XH7QIEp03xjeCWwWTESggjOlCztPSdI=
X-Proofpoint-GUID: Djxs97SD-Di5tFundOtT7eZODjUtgfs4
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aed8f04 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=YFy_RbSkoLDF6nbOkSQA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Djxs97SD-Di5tFundOtT7eZODjUtgfs4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060033

Enable the JPEG encoder on the RB5 board.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index d6af679abe1a3..949328806a9de 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -668,6 +668,10 @@ redriver_usb_con_sbu: endpoint {
 	};
 };
 
+&jpeg_enc {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };
-- 
2.34.1

