Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DD24F96AE
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 13:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417286; cv=none; b=O9a9K/x/Aec33ED64qDjoDSsts6iM0x6owLT5HlnQSt9tb2wJkta+JQ/PK0jDQM+zFsmfI+cCO4vUF7WcVi8vHzKsG9qfP6Sn1kgwy3+WLP0xfYWOxYSHHUQKK1XjvbXZe56/TqoLTi9RmxL/LbSFW/iC9Mmg5Zk/HXkirwc6zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417286; c=relaxed/simple;
	bh=oEdznP6hER4p3RkDnlVcGRyaQvpsV5C34ALYggRgtLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aH/ls+YXPr8ACYnhgkbrg17YyCZi7snpCwfxMqtbIMIKPZOMKptEw2hrFwETmeMGMVv662dWSPgHm6hqFsOHPoomadFbObiJ8KZrhKq7TeO+D+Oj12J91ZsjghlHFAD+j6u8SpsO81K4WENuwZ7qFb7RLj6BCc39cAMhv8v9tKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p5Hkgz1D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UokngoG1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p5Hkgz1D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UokngoG1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OtOK1348215
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 13:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CXeRltm9E8aI9A97Jt7ApaQcsKf2+a0hl80xE9m/h+E=; b=p5Hkgz1DaS/vwmfq
	9DASH4aLQIrCRDQQi0W49OFKpF1t4JDKR+JUxnu964JlYvHgAXq8HapSXp/beMJN
	0UCBfRM2n+lXZ2qUILFie2KGmjexPRPZbfnJko7Y7cVvIv1xo5IQXvI9ojCjUp4f
	ddhBDS6Ciy4Y1m7GZtTQMVCZKnVR+DQcXknAERzpC498C7TbEmRvnnFY1TKxS6Us
	o8UobQ05cQkFYqSKRacUizoxfEy/R8q3/ve9j5ZLVEDfWguk6q1yXWA001yQ3As6
	1l+ZT7UQP32XsgT0h9bxoboTIE81qTvRoApejyVnWRMgIneF4gRNCadaKz9edeH3
	ba6Ccg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rhb27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 13:41:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso424548385a.3
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 06:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417283; x=1793022083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CXeRltm9E8aI9A97Jt7ApaQcsKf2+a0hl80xE9m/h+E=;
        b=UokngoG1Ant1Q0aZjr9XNrrVnJTZknxQRv5KKqTGBiR4EvMogD4TJXVpKY7dwQyjn5
         /OCvglXCXwEVmEGdP8/NgnhcckaVr92Z9gz01ORoeq92FbU1eZSX4xM5kydx3Qo04m1j
         h6LsZe0jE8DN4k99ZUvw+QNfCzN6OJuZSEJofx8f3nqR+ia74eChsKQkfQ1z39VmW3Vu
         M5c7MEl/vVAMlepRgNn8yYK12Wz/U0dpIwRO0HunzfLM69F6Rw9Fxa+kbpOddV+GMux0
         bWQjXqDx1WBOqHrP4ZtQNOJp+ZQ7rlJ2ANoyH623JTzxNVCOMOviNMbI4c+UL0TSqKxS
         KuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417283; x=1793022083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CXeRltm9E8aI9A97Jt7ApaQcsKf2+a0hl80xE9m/h+E=;
        b=Zv68dMk/752y9fJ/Li6OeElcod6pOwiebHAVz78RDhfuE3luqnWjTclXpgjU7Qb1hK
         ll05EckKxyURlDhZ89gNX9LwLyiw9q6TTpgLF2aSDpElL7T9fR/J+A3/rv20xAehpM4o
         VXVW9L2Bafmriq4nzM6kZBH3pnVN7hECOkHeuEfBAn0+QVz3PZvkky8NTjv162SbND8g
         Q2/3UBMEIXeFaUQa5LR5Z7vHrAdGudTC+pbc0s4zRTND0j2H97hmOFhOMk0Rglz2RXc5
         kxNKoh8E0gw5rmQZV7RrT7XOvpu7a29OjM6r9F7iuax+j/A5NWOG/S+QvQfFSc1do8vm
         8WOw==
X-Forwarded-Encrypted: i=1; AKwUvBxU+/zHkWRgo8WUlWaxQpsMq5ddEuKhkMTyQj5v5Q3eZC1iCn3GV3rivzkKXQTrxO0ak4XEzc/LG4OnPg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIHsB8F11md5RS4QOgrt6bJMi73kXIkRF5bnBoYIEOQq2UTN5vf
	wQpFlPqewOUkLZwtxNakHG7q6BK/0vDopNZc0vZw+hbMsh5JOJkUcifVVieM5+Ms5JZZIpm38+A
	nkwho26CDSiejYRFf2ZAt9XmJjSXWP4684AT+1n5MAYKI1WNMSDGzcSbNtrCBH0qtWw==
X-Gm-Gg: AYBFou1E4+0JiXXElcu5i3d6CG/xFFdn7ixZ5PhMn2HVHZ8BsED/9Mh/8cuKe9QpHVM
	WHQNxaNjoayYdES3GgJKEtQpCg2zZ3z2NJn8tVRo7sfo/LM9nUOm4eMheTL99ocm9bYvCjGoYOo
	sTQP9NaI/TyYcmg0ISfKpRf7nhI9PmSRJ9DhgJ3oFHi7blYzkhqZcsCylI1UbZnl1JxI5JCR5wb
	c8BZFfg4Ds8V1OhJfXd42bUtmmgLvvbjccdgV2OQpECvDka8uLw5fqST5hFI4dXm7b4FVpcK+vc
	PObTRFfBJPft8FDt3ViPPLmZDqPbsKUI43hFoHfrqaKs86oeb20d9b3GENpnlgjZiE8KERVsHwL
	q2eSQAYkN6nHdrzoXHflRn8GEotskgC2OiT0Zo0BBtUzcRNWmpHNKy65eFA9rH9OeqARM7vZRlQ
	+zytGiPNlJIOsi
X-Received: by 2002:a05:620a:29d5:b0:93e:d854:4b83 with SMTP id af79cd13be357-93f29ceeec1mr1288555785a.22.1792417282849;
        Mon, 19 Oct 2026 06:41:22 -0700 (PDT)
X-Received: by 2002:a05:620a:29d5:b0:93e:d854:4b83 with SMTP id af79cd13be357-93f29ceeec1mr1288549385a.22.1792417282196;
        Mon, 19 Oct 2026 06:41:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab473d06easm4409851fa.31.2026.10.19.06.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:41:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:41:05 +0300
Subject: [PATCH 06/10] clk: qcom: mmcc-msm8996: keep mmss_mmagic_maxi_clk
 always enabled
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-msm8998-fix-clocks-v1-6-370949e4d8a0@oss.qualcomm.com>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oEdznP6hER4p3RkDnlVcGRyaQvpsV5C34ALYggRgtLs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1h3yOK8vkUokO+sXyGMj3EFT+PwQ4GkgQeS98
 kOcmDD9HReJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYd8gAKCRCLPIo+Aiko
 1fpiCACZR+kSwELBAoJRJ8lYA/yBYT2Mz/YKRZmb9j9jB594mGugObqXj2xnLdcAHfDKek3YGFp
 HF8yxi4JVCgPKJhNGZhcyjhv+jVbKqaUQYZz/x0Yh8cs76GNgFgA7kyr2Evn0is30ssbwbs0R4d
 wjTHOEg2iBTkdXkB0kYVCM4JySOqnB5jQs2UwuqzqX4QgRH5D+eKZv4pjWvBph6Ru0ArZgBw1Ax
 zNOhH3L0fpaoyXss5W1NNN/rZBZ3KsYQJ90A5txM9iK+vsjSC0ZibOaacWbpt6kgbdEfwhLjToE
 2G6fvwExj2zvnTWJBZXpmKmy4STT1wwwN1MAcDkZcFFphpd6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Cl9Ql68J5WAJ5nOwx5WWk--KMWgqywOf
X-Proofpoint-GUID: Cl9Ql68J5WAJ5nOwx5WWk--KMWgqywOf
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad61e04 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=PFv3ho34_BknXicu4MwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX0rCxt7gA1sZ2
 58n2mZ1CbKf8mfURnqz62HTZmoTuTrbCZvPKwI7O2AG9YlC6+OZsscblPgCyNFaPaxZSDsMkyHi
 Djuyv0lqbN9bQqSwYQxRRmw1am43+par6zXFNID6oveq7f3DyVg8sNN66KyOJmkQ0NK9GPNFYE9
 9XMo8ZqLqZacY/Yp6DnIJIF5BjAwEV2t7pYDU1Q0DjlbEQzQM7n0DKqDHgfGgvb4K3YxSUoDonm
 ZD+0UizL01Iyw22UINVTNVQXx/cxY9ymk0B3BA42x3e/6iW5m7bQUy1cFSAJ6Zw7WJqqwV/dJ9z
 PQfs/9Cfa9GSUHRoKMUUc6d1iwii2TJNAQU+aUw1It/0WiGfCkIuEZDAeAbTTFPWTbRN88KOkEZ
 GojM1FeNYn+A7DBD0sBrvbYt1A5Ym/Yiiq8OVBFE5OR1Gz19xbusiZ1pvxb/4F3Jbm5zO7AetV+
 WiJl8Dcp+QzqPe4vVfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX3jJyAqd1DWf9
 /f9hhzk6qZiuujfdSqMh/jLtEnMZ5BDJOWY9ASKdmWVrJPaSb4XX/amASJkAieCuVcXI6SDbNPC
 h+PQ4v3DfvGG4QCrlCIn27PJsgrzKiU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190054

Enabling vmem_maxi_clk fails with -EBUSY, the branch never leaving halt
("vmem_maxi_clk status stuck at 'off'"), which makes the VMEM block
unusable. The MAXI branches sit behind the MMAGIC aggregator, so they
cannot leave halt unless mmss_mmagic_maxi_clk is running.

Commit 7705bb7176b9 ("clk: qcom: mmcc-msm8996: leave all mmagic gdscs
and clocks always enabled") marked the MMAGIC clocks CLK_IS_CRITICAL
because there is no bus driver to manage them, but missed this one: its
siblings mmss_mmagic_ahb_clk, mmagic_video_axi_clk and
mmagic_video_noc_cfg_ahb_clk all carry the flag while
mmss_mmagic_maxi_clk does not.

Mark it CLK_IS_CRITICAL as well.

Note that the halt bit is truthful here and must not be papered over
with BRANCH_HALT_SKIP: touching the block while its AXI clock is off
silently resets the SoC.

Fixes: 7705bb7176b9 ("clk: qcom: mmcc-msm8996: leave all mmagic gdscs and clocks always enabled")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/mmcc-msm8996.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index ef7bde361fc3..b8dd374df2e4 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -1341,7 +1341,7 @@ static struct clk_branch mmss_mmagic_maxi_clk = {
 				&maxi_clk_src.clkr.hw
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},

-- 
2.47.3

