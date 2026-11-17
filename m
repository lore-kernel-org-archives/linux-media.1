Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897303;
	b=KGO2IoiSJsZOifGu+dfBCP0oCp+zhFFHNJCAjpX7vJUyZNQvkSFWDedq6oEHO3qgdG+X
	 RdZLdXOl95xumRzOQQFvRF7jq48GdM/8/Fwjj4fC0elAkf1RuL9z01/YPv48gFV4kaZhE
	 kselkm+9IDh4XhCUDfyrqF0UhiWv1DD3OdeohEQnvSVYBQASZYG3v2E8SMz10DQikfGSv
	 q+F/rhNHu0cUhNRxRmlzy8YxFLpaMKFUwygYW8ZQWYfG7lFgUX+C9Fr2eJdanSGvMPWGu
	 8eqvn+v1mVUbYMVcdYMZJs9UHqBQJOr1TSOjFdvXdTl3PZHpRfuErhYDauDa1PJFFiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897303;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=;
	b=dlxxYhodroxMM1Eo/OrS13oaHv0eueY8nawn8aIBENPrWdGNH7dTKk7FiQucbIbgbSP/
	 31CvN9xXkerLZlolL6XiuW761YkaNcBiZTyKA1FgkR7TxE7fuajVOykvrSgpAuxLTUMWE
	 JdiHBSu2EKWK5EixVH249AQ0o12RJ5z6acLakwmftJLGLX91Xq+UyRpRqCN46lS2d4bWa
	 gXJTazHHTcjO7eSrO5DiXooHA+jeWHdvI5vAX970WK34KP3nP5M81px/Qk6yhAFJ6Ph4T
	 tqLjvPcZeX8yEQdXBQyr9Lc+LfnEtVE/TNOvSSK8Uz6AVWvbqEo8KtC2PMqd9aHtnmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QWbc13Vm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TYGo9fox;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0024E606A32C
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 06:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0024E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QWbc13Vm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TYGo9fox
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6Mxpm3982610
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 06:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=; b=QWbc13VmIdJvnXzA
	bQiATrZcnstmTHHiYR6z7c8SXurnSXQjcNElEVWRw9/7Uqp4h/G+PdHc/tn9gGKi
	KUjKLAxo1ROdxa3AG2rbJobTSiMHXfc5h5Wka5NBVMRC8/O3Vczzr+EBXujAx1so
	srX8GE5AYypBPMwKJSVBjjrOsrjr2WpWTYPlWmwSOWBmlPcqeYvK6Nh3pZMcUhi7
	5pJ3gqRMgt5rKqy+5gYQmvk/j3dBfvjQHiFhU3AljpSjhonuhmcmXdq8tqfoqp/J
	1i8UcjhhwoUkAKgBu2a6pK3lMW2tOhrBigjb5wlnk2not1hmV2X0MFvP+6su3CN6
	Mr+6zQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd01mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 06:35:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so3580732a91.3
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 22:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794897301; x=1795502101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=;
        b=TYGo9foxs3rekmQKGjGedjGlFZcozrLORoc7LRb8zc/shqcygtGkKCjHaktElA2yjC
         a8sXQ1Va83cGWl26Dzjli6kBVyKakIaZhraIjKslQZGv94ru8aVd8fT5FzEFDKZVT4Ck
         /+AV+sQA0L5MqEOG9iv4yBrl9fJjpNwCxZasbE4/99qZUvSNki3MdG3vGIaNOMp/vM7R
         OUQpgRxDH7a9UFBghwNh4gn2oup6RfpNHRo4LFeSA8rfh0gyrZHEHaSmVMtJ6bIvxhrQ
         QW+dpVKzLukOe8biH7fJ6IwVPFTivqQxCbBSs8xDzl/D881OjKpLR/UPInTR9+JZXZbt
         3g7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897301; x=1795502101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=;
        b=nLzgoRsktU7apvLin6+JN/NyS8p5RpEtCV+jI+I7jIdXqMADlJfeFrFQJtEgJ/X1Ez
         IP6EkQDj4q2c/05fKNnSed5td6I8a3KkngpCmq6/gufun7O7KAY1bjmlvZs/O915RLqx
         AuzutadZ5w+b3EsXi1/lUSvdYOTTAwrcGYcUG+X1YXBKqHKUJjZVd9T1B1ld73JzI8b4
         6r9ovlvgssLVxXD6snR3pwr55cTPOfU2aGosYPPLtknMTEOLuVRPB9nOXCZ/hW61oIsX
         difz0d9ZFlnyRhXvkogEXLuqHnEoqQX726PdB7G40Kktwm5R7/ONjwZTRTKsYZr/8ZW0
         f64Q==
X-Forwarded-Encrypted: i=1; AL+hErHhMGegeSWZwqIwMtc1EGjXmu8LgtH/c2FJyEdjQ4LSmKXWPqb3dfhg6jFDfUA/vEyQvyOX9tLLGdynow==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Albo8Tsew1SdUQvbTwBylgCq0MyenUZDCgn869Xsg763GZsj0
	ad7ERQVQQOw1LVzxm+tm3KLDnSaN7KpzHnqOgFYHa9rxjiLpitTUZ0xW0ZJAukxWBBWAc/MRYPV
	eW3xPX6fHaman5MdrhEXvK7S3v9U5gRPBWWQB7vE5Mf2I0LfO6nIP/hwz8wCbnEt1tA==
X-Gm-Gg: AZFdTZcNB/6KPNY6Qsm1Jg7A6u4o4w3NUTvrz6HWzeW7dY1JLglyX6tGxgPIOKw8Dja
	pF6rK265j86/n8TQdFs8yFxekfV9udT1sYqc9C4D2HFUdzUpXmh2OwK0YpLF7bkci327hM/9mlf
	dwvLXKkTPQFVgH2d9KtfhEDu7wVBt/owpcAzvQkFlxa9NuBvZkjai6QNBzM0qDj+u7cJ3++HVNy
	jWoHz2vFnYuZPcCAnwXXnc5fon4zJHf3wX20XjA4Ehal14+dR8U9GyTIht4+VpYoCe5RKcGojsa
	qaRBvEut8N8I3D7KCYSzgL9ov9P/uqmiZ+5keI5FcWKYXOre8jf6ez45+U98fSy39os3PrWJAoY
	QdVyxhn20URmgLv2UnwP/O5Q83huhxNWAzuGN2oayjXGuIo0zogcuULenQz1s2c3zU38g8A3Yru
	6NRpX6JLs/EVbncFeN0vu/xMxMKMJiMjYdAoumWpkAMahjMmeO
X-Received: by 2002:a17:90b:4a4e:b0:3ad:4a8b:c6fd with SMTP id 98e67ed59e1d1-3b1b0a32de1mr11270211a91.28.1794897300605;
        Mon, 16 Nov 2026 22:35:00 -0800 (PST)
X-Received: by 2002:a17:90b:4a4e:b0:3ad:4a8b:c6fd with SMTP id 98e67ed59e1d1-3b1b0a32de1mr11270183a91.28.1794897300084;
        Mon, 16 Nov 2026 22:35:00 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18b4e68sm5202219a12.25.2026.11.16.22.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:34:59 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:34:33 +0800
Subject: [PATCH v3 4/5] arm64: dts: qcom: eliza-mtp: Enable iris video
 codec
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
Message-Id: <20261117-add_iris_for_eliza-v3-4-02a55a9272ef@oss.qualcomm.com>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
In-Reply-To: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794897274; l=835;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=OtzEBm9GVTRTWQb4gQMb5Xq+vFscZcbSu2JVYbh2zdI=;
 b=T1+ZDyLe22DDEQKX6BrZVf5duTn/QGSsXWEgvXINf9qJYvlUSBetNpCRe9y7/u1BNyumlFgI8
 6ZxZLWhbyNHBvQMum2SiJuTsqGLezkZy5XyZHA5TU7A4+lVzDbiM+6N
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afbf595 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nChROllu96siAGe8wIkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX1+UjX/rsDNzZ
 +oUuNxuf0ls9uT69hGnQLF4LNegliYQanCWQJw9IMy1KQ5Ps0Z0Vy8SKgRU3ga4UX1DMY5GfdOX
 9xEIlBbSM9WnswT9+LvKEv6bYWlcR50=
X-Proofpoint-GUID: BbEqUZycURbu6-QGiHmg1W8ULjv5wZZO
X-Proofpoint-ORIG-GUID: BbEqUZycURbu6-QGiHmg1W8ULjv5wZZO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX4YWbOJUQh1vZ
 xD5X8t/7+o/ZjLQMOezy9E8GPjPnwL1Xwvm0sayY1yF3+upkgmdsCwnon5gSduUqfhc/oPMTCjU
 9tjtqT8NrhppqvErfeARp+cVe2KBUXggfugS+yEK4iuH7CLX7/Ze151cShTKjuShZ+qlVkeF3Ax
 wPlzLtkX2vi8CfUc+CD83CQ4WoG2Y/IXQOCdSkV1A7aDoVuBB9z9htkEh2q0htKH4d5GXS+8uit
 DO9+uf1JLxIVtcei+qFUSqBq3/9wEGfWwdlBR5pt5shdRNdCrvVSO04XC+DnVHS472CoijKhO7s
 0A5WJMpRJASASbsyeNXjy9LdRngwwMY1vvAHwpF1TNEP+9mlALAIBuSkqWVyk0x7KMD6KEzEVZw
 EGdAcTWYTVnaMP5QrI5WIZx+CF9C/MQDyinYf04Dq0I6GfqaDZig/KXi7KRCL5Xjx6oNCPPLF1y
 dckBkMeoqOUyNZ2qgwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170025

The Eliza MTP includes the Iris video codec, but the device tree leaves
the node disabled. Mark it as okay so the video codec driver can probe
on this board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index ee05192adcfb9f79cba59f11001b640a8572cc91..e5a698602dfc7a2d3ad00eade40d4f91a0cee57d 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -430,6 +430,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/eliza/gen71700_zap.mbn";
 };
 
+&iris {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.43.0

