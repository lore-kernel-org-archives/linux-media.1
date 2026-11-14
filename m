Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655840;
	b=CtPRUVK54BPEJ+p85JzfRXVhwEV8QnJtx0TojDXfa4HnIRLru2cekj/q1Hqxu+bq2QRZ
	 6iPPsoRDPTmIaFE7TeCIwyojwhtySJTAsGGrAFnh1g1mR3ymcdGyNSkq6PpvOZA04HRyq
	 kHjfc9mosC84e5HK+yJT0jZ7zW8iGuseuebHZCf9cDAcbJQFk/TnQLpOQ7PvBgRKvzQaR
	 0N0zmDWaY5VwDP69DjOnmM9CWKLNl1eeQeKCsww7NwUjBja5iUerqTUMrOl+GTfgdrxFx
	 0EtAWCAJT/ZPuA2v9Z4rTvEiaGRj8ialqXZNmYQ7VVmh/JA7aegXbmvNoNJmr5Sme1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JtnzJyvk1KhH53ox2qEGTYmgQHbNRK/nZXY80+689io=;
	b=x+v/nUj6nDhpbLtRwzSvVipdPBzKD49ppPQ/+goJ8uUXFbuMaD/Lca0L6PqbnY1aZ1I2
	 43ikTWKVfeZ/uT0cw4mQXW+AbBqeo26p87BSeBXt27Q+7FXEFvNQ1SHtHuDeDgTRouV47
	 ILoBik16qR7V9YNyVUoHb2BqH4ExfzU+y27gJjLYJNsFGIPUNCaePAIF139thEDEaLhV9
	 FsAZs+d0a48QYth6fW6y0NFhhGGk7+9DDjL1eBlD5t4zh5NYuc8KYQzkmGWNvzEe7+ZTy
	 hWvdyMXtoyRFWgIsUxyM2hfHAglplEqop4e3BoHz20E88+Sz2C3Db6n+2EXRCtzNaEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pqurAJuF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bc7ziPU0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8519D606A88C
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8519D606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pqurAJuF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bc7ziPU0
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wRbO3276504
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JtnzJyvk1KhH53ox2qEGTYmgQHbNRK/nZXY80+689io=; b=pqurAJuFTeiYXqDV
	PyIQkXvxpjpyOy9IqxV9p6GZJze3lWc3aHDuaHQxtr6RxRNlW8+MsC8+84GCVfkI
	5DaXgM+Cy0efyHNjf8yQdoFNskRnxVVOpvJCc1bvCCHlI/Rt+VsVPgeo7BKsjwb3
	XKEsbr/3xFQVB4ss74w2lVoxko9PIDGVoJ0wBJgHN5CsYSN09dXpIR5RI9Bq8bLt
	4omvte/5mvOkWdRsBKB6pETjJ98KpvnMLwqxG7JvNFJRPSpboiZTEasOfTuoSsq4
	YEmjCDkyHFLTPpEgvsL695fjCrtpuOVpyZdEXersqS6/EJ7MbdHvaK64FxMRYRRT
	lXZvcQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqgrdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:30:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ef0fe2914so36077346d6.1
        for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655838; x=1795260638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JtnzJyvk1KhH53ox2qEGTYmgQHbNRK/nZXY80+689io=;
        b=Bc7ziPU0uqwTepl5svhOvaFNo1R/P6fA7OYtr0UVoF1gR0b/UvIWOPnLrpTTnYH3p5
         1C0J3UUO0xd3Ply3G49xmiU3E7EseOCLOmdwHw2aU6aoSC+NRAovAlHdre3kEGzFffjS
         aImh3UCFKCbDX1K3H1CQsDPho/br5Qh26hqpQ948cuMMbiY1Wlg1qsZ4xOxpTJ2HG4C2
         gs0EQ7YfIRe/ujzGe7iyhd+LAwjuLqmsjTTKPPgN8sTl+uVJr9iplW4YwViUMT8LiFke
         nvjUR+y4bqTsJACfmpbsbj67WE6ilDjP3bNmVG52XHFyTNzM4gS5QQelaR41SNKOniUS
         NR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655838; x=1795260638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JtnzJyvk1KhH53ox2qEGTYmgQHbNRK/nZXY80+689io=;
        b=oGDKnTHRMTDVCWQeaHcAHxaT13x0KCvQfLAP9kiViZs8bPGQtzpUXDSBRqhc+kN9kk
         5czSehsH1R89pw40sH/U0RI1vgA1yl+CBNcweP40FjKaEVAF9JJ7rc7EcKD4klaEhFq1
         VgeEp6cyeGtKwXTwh7SJ1C9Ac5Sw5z3Uy4hKP+qnFbso4HvHh9MStFVXQQ0D64rWiMYR
         m/6vZneENJT2BowEdFPGO9j2P6iJv4h0mMd822NayJEHnRDbVIh+GFM7h64P/TSYP8sf
         8Wg8t68gsiRJdDxqJTE8ZiyxAb3/oRy4+MjtBViaxdyOGgPrNTcy/wsCYjR5wAG3RTIX
         R0Ww==
X-Forwarded-Encrypted: i=1; AL+hErFCJYJzfiMUubD9+Jl26sn/6/AIoSa3/zM+Vx07optyf33v7r+bktgiCoXbxnc7yqsVMVDRs0/9w1bsuw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8YmWbyFQnRSGaggLN5iNpKz6WT8F0eZfmPxOw/KIX0Y3JS2ixz
	4sJk0gX9aDQnlpjrCFlXrOp6ISU9N246N4Aqz6/bACk4dzPzfFR1nkuLGxYr3mwp3t11RM52QzI
	/uI5C+b3VwFuF91xHXOSyRNy9NhMeWC3n3RrCtK5uVxOOuXrVz/bJOmcwZTApkn7dSA==
X-Gm-Gg: AYBFou21EJXihWKJ58RkWa0Vk8WCtBW3n8h0QyMTpwINi/wGEEbUFpY/Rmz6AdyWuze
	2JcyFgtply5ze2w8IcaANNSb/PrrJXPdroqT9tt/MPxUjCpoIp2Awc/QhSgUthXkK5cPXu4Os1J
	0q+ZqMi/2BCuPdhhshW3rDRQRVDTi+OJ+M0CEVMZpqF8MJLVOFh/tNxeLswivOgNWC4NQfqytvT
	dSPUWRq7YUyS7+PSUnstCGUp+GmT9A31Lb6E45SQ6G5bs13x3M1NN+TnUt9+4PpGJROkMT0vGCf
	rvSedmx9FCFR5mbJRyeou20MqLK8Y7HDzNoHBPFxoU2BY8WVYnCA41pHCJ98UkF/eOJ1Bwr/LP+
	Fi/bvEn6C+bHv9ZUGMReqqadOinfCjFPGYfFO9HJAwDbM4kgDGmoLnOchoDGKt0VX0jVlKwL6Zu
	PIcvcFZYBMoezE7t2qwWU8rwNIT+VV6VgRSyPQmr5B
X-Received: by 2002:a0c:f00e:0:b0:91f:119c:49e7 with SMTP id 6a1803df08f44-91f242183a5mr64201136d6.33.1794655837839;
        Sat, 14 Nov 2026 03:30:37 -0800 (PST)
X-Received: by 2002:a0c:f00e:0:b0:91f:119c:49e7 with SMTP id 6a1803df08f44-91f242183a5mr64200736d6.33.1794655837376;
        Sat, 14 Nov 2026 03:30:37 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:30:36 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:23 +0800
Subject: [PATCH v7 06/23] phy: qcom-mipi-csi2: Add SM8750 support
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-6-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=1231;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=WftKjWMmd6ufkhmpBXP+kU2zClT4Pa5uPn8ECol2Zvc=;
 b=1hq3oXdyhFU9AflJEQbTquWWh8o+HWgH0+JcuLjn6dZoVnqZtl2X29Hz4G832z78mH6JrsmOn
 5bOzwxRADg0DavMNQ2fCQoeoL6og74SBbUdPXifKfoxZgdufnUPeutY
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6af8465e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ccvM8GEhhlxfBWNg_LwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX2pxWAfdyQti2
 m3veZo8jzAH09fqYdtlgbIqqFuDV/mLYyikGA44C+oAN2SRZ55f2W5lqV5tdSxFua/zUO4Tx16+
 eyzqK5be+o/J/rfPDde2Q0XL1JYhLno=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX6i7jD1YanFYd
 iziJXtPtgrfse70tY0NUXUd0vyWS4vUFSs0AHiOrrr3lh8FU+AM71UIasxd+ZPD3dz30ZckAy2D
 UNGeQQfzPxVX9zInHuTFCDgM6hGODl9t7PYFdh6UK0Q2+iPz8+VTv8OccquvDScqhWsoAfvUU6x
 v0QOMEwYAw4jey/+QpTchwJ1zmRCzWm9y/Wf+97GOxcRlePq9stHVRazoWVvBLrU/MaBweQazub
 vAnn9zWyt9PgJ3CInfkWDKARp7IqQrZc+ABhZyUzycRtlqetNlMsigidY8A7vDKcocdzdLoC8li
 39rQLW55o4/CWDo/Nw4pEnxyRRJD0vjegtg2GC9r99J3iF2pRPRIUGNqKhFcQ9gaNAlix0sG7zG
 QVAjZP99xei3NSwaeRnMqU4hi9eQZQZFSKnQF/mR7c0htksl9ZNYtR2L+tu+DdG6ED/YWmOLI2Y
 0TMxpEY5WN66nkaxHAA==
X-Proofpoint-GUID: l6z073zzBx4UB4CJPj5-sPzAfMLMKBOP
X-Proofpoint-ORIG-GUID: l6z073zzBx4UB4CJPj5-sPzAfMLMKBOP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1011 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add the SM8750 CSI2 DPHY compatible to the match table, using the 3nm
DPHY configuration.

The SM8750 CSIPHY nodes only carry "qcom,sm8750-csi2-phy" with no
fallback compatible, so without this entry no driver matches them and
the PHYs stay unbound.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index 165e3d026872db85e54a99c5dd25ca68a1a4e450..a672bf318487b16aacd1ecf165554cde3f38e292 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -444,6 +444,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
 	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
+	{ .compatible	= "qcom,sm8750-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
 	{ }
 };

-- 
2.34.1

