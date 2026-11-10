Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328769;
	b=c1NfBrdxxqQ4Uib7AQE4MkjSTdxglXl3Z0tV0KYgTctjFXXP+/Ituz1LJcgIlEYL53Q3
	 EM46K3gy7O4L7qYtiyA1le+DXgOoTlfHYUj6qvnmlXt12TN1J6w6mbbcxZ2st+q4UB5Fh
	 6meYyIBO5/ldFPywOMvj2L4ho4pa26fQQZme+YgY0BuBOi836z/sY/TA3XZ9zIsdiDaEe
	 Kwn6jsKYnWf1xGVWr7AE3/cYXtNk7DHXOp9m639vuOG9L9SrS73jN9/6eJopmAvMXeERA
	 GfuhbKkEVB2sr3+dchNdRcER9bjFq4t6kSmVYkDLiy4QSyGFKgQzcXD+3/4t1oXqo5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328769;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
	b=BRjMxWbHEilJGO0Ifa4aRG2zMMaCjRXAl65wI0pBdhXc9pHtSSvtxM4+Z0Wf3q7AAyV8
	 2g/gT38he9HZOXS4ha8OLb0NE2zYSBsQeZGVCZtr6RPJOnoXiVxGP6TM5JgW/0ez0idJz
	 6FuCUjuwmjWlFrs8bzU+cDXiwDAK+hiHVNTAuO4mS6jGRROM451X9pb0swYGOo7c+eS4/
	 pHw44gmDuVn4GTpTCEANsOCcPL8BBYqBbIdrNTqIiLK9+uSXOqYFxgDSDs9mbX+wic5tY
	 8Lb88ZQBJ8miaC1HN7g7pNNkmEA7Hlt1NDl9OyePjIDgjQKnpULgAxMBbHPi4BLoTtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="B/tGTLUl";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=POxdAeS1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5F6606E82A
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 16:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F5F6606E82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B/tGTLUl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=POxdAeS1
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF1iIR2098134
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 16:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xtBrngpMGCe
	Q6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=; b=B/tGTLUlL4K0hJ1Q1MWsk7HzHGo
	wLEaG83DQtjsmlsenGMR46YrTnIVk1Kakl9QDejjuxd6gNdon+MeSim9TPrRooxF
	RlETV3dDdY3HrJKJKRHOeUyNui3JqvWz7VwQbBtYakjHBbSeweQqnRoRyhoEqcWG
	kv2syDYc0DOKLqRZ2oM5oOi20vEjOm6pyuoX1GY+RzqmYIzkpmy2pZ/zcuOhwDTn
	UIjkXNKZBTZeElsbQfh3AVzL6FseFPER83WfLb6n41Mdiv5aFXN25kVcpXfI2F2g
	7xlHLk0NAeIc5hH/UsfbeT1Xx7E3ZAaITl3Tgm8g7YKo+RAMQ3Ky1FhhuIA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv4b1ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 16:39:27 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2f2df81bbso1407416137.3
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 08:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328767; x=1794933567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
        b=POxdAeS134a/bHTQP67miwPT7SR1ie8Rh3La+Ea7PL5jU6v/4O8mLYt9n+Mwhnh7e3
         XxR5xnAsgP/reK2x5s+L3pmkis0jjBU9nJcfP1byfMA6D5HGWY4rmZqhGirrLq3kLJXA
         EpdlfAoVE+0rAbt5655CBK3sSIaRguZekV3lHwLjNnOaZAuYp+thbs4jO1Cbfa/0nhvF
         If5H+rkcsv77MkPMrJmEzgelAKQG4+FU+o0MH+cgiuEqMCqi93qIFqw0FmLmQBVvud2n
         j2kJvoglStuUBbnXOKVPgZ4A8GBjOG9Vz1L4ekRSvbOIVd6IzJfK+2kok2lf15rFgRI8
         EGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328767; x=1794933567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
        b=1uXgc1bgK1T/0G8qP2r3tB7HJKTH7ye3zDZe72WQ5cKfw0ocu/2jYOpWA2EjuKzUjj
         iheY0uV+XVeH0a7N1ACgDxYAA7quyiwn9vl2aq6Ha0v4sLOIELEltoI1MjXlDhRGEy6/
         Gls8P6q/CtgVzf7gP8rFoQGVRloDC9HnOnLQJlJ/ONiL5mueiDCq12jNfJykwSN4V2G1
         N9RquwKYN5FyIl7yEvodn/VdOVh7NN3iPeSGq8vYMHIbe57aC/YeUczLMhhj591Bp7Sv
         2Y2vhABfM+DJ1gKDT97TJYVjN9biV4k6hYRCrMuBBsP+pQXfMZ++HW9rjFExdIJXKEwV
         cm3g==
X-Gm-Message-State: APuU4Z/srr7xfymFbYA5tCDfr9X0DG822VdvofTdBpx0emDiztAX3ybQ
	NCSlJ6B4Rtbame33SirgeRNb039Xm5+mCdhh67KAe060x/4xeTpOjU7XDwjclI1XdoNjIOpajr6
	AHZavopJb/3FqGKe9lAMz+3g7JAfMD+PgdscTYDTDgQDWV9bgYJEnLLIts7Dn2wcVUOkYeYmNuz
	29
X-Gm-Gg: AYBFou0yxulKMrYQKhHdJVMsexIT6gGyP68o1A38acXl8xvVM7x9sY/rs4NclTrewn4
	BkbKrc8C0dEmczWlpRAfKmKAggmEjPslOQ8vrBzwIYsESUv9HoDbtA2ZGaT52KVeyw5+sKXZmTp
	JN1FFf5jfVLVNS1scBy3d2vlbEjevTpclUImFf9ZqdoXdZxGh9JMlqWCgWk9HfSUEb3tqcEsHfg
	olvXzGXavF4TFv9UKRU19lrquwaJ74IVfcOqQbQtgELRtKryXZP80YpsC20IeUX2a+9OLjmwOy0
	DLiMefk3MLwTLLKA/5C+n022/bGa6xHnbUYQjmxWG2nB3qKRa7WctrtbZj6xfbmTt28aCUfJIqx
	w7PEsOhjScBZ3vfcxsOH3FT72CFqD44Lsbb2yFYT3oh+OK0CupvPAjjgc5fp3/KV0YAQhPP7ZWQ
	==
X-Received: by 2002:a05:6102:3910:b0:7c1:8aa5:36c8 with SMTP id ada2fe7eead31-7d301c3ff3amr1254813137.36.1794328766618;
        Tue, 10 Nov 2026 08:39:26 -0800 (PST)
X-Received: by 2002:a05:6102:3910:b0:7c1:8aa5:36c8 with SMTP id ada2fe7eead31-7d301c3ff3amr1254799137.36.1794328766120;
        Tue, 10 Nov 2026 08:39:26 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:25 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 6/8] arm64: dts: qcom: qrb5165-rb5: Enable JPEG encoder
Date: Tue, 10 Nov 2026 18:39:07 +0200
Message-Id: <20261110163909.78085-7-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX2Yc+ck7O6li1
 fqs+vVzxzOIbIxbfVPtB85YCQPeBDq3GIgKq3fOHriZfwC4agYA393QEeFqYrfjszHIUbzPSANM
 mykOrFjN/ACg09S1BXCMf8gjCxHQ+lQ=
X-Proofpoint-ORIG-GUID: 4mrbh-NR22_h3h6HYFnzKOw7EMe-acOY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX2dkJwM+vU2oU
 xJsUeEGnWMUODNaYhcdpu/uK70Ew002Z4btLVykPE9c37V46uXzM0lxrHzoln79Vhq8uoB3hh+a
 LAOnVkikAvQ0t0lQviixyEyCkKEOMXETr13gOKn51mEQ1yfgSVNJHmy4Pr45RlGE883lc6sGgv6
 jgl37ybBd6hil6iQfV8D4Aqca37wp8chsbYY5xwL+68+iNAgyQp16aa7wrksAYevGbA5sFjfpSp
 aVvLSj5D//b8t7ggcgpaXa8CQAkZoVJ5fQgcBFMZdIa2Tzh6BF9TFodKeSTzS5JuBo+xj5PkFcG
 Lx1eTQ62J3NBn+vb7nIH7xmhJQrjU2bjHB+RwsmbFUxjsr5Zxn7E32ZdybTpHsowVDrabhZNa3L
 T4s/5c+b+YHap9Hv+6tLoWHucofWhlox5rGWdgfDO4vM2Jt1UPEStWUHlKvPlJ7Ed14VAlK7+p3
 un8JlGWwRmtTQBkD0kQ==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af348bf cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=YFy_RbSkoLDF6nbOkSQA:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: 4mrbh-NR22_h3h6HYFnzKOw7EMe-acOY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100066

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

