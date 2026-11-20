Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160559;
	b=xv+x3K9VUjcxi7YYsLwoS5QZSLDu6ksjCOMD7dA7dd8cf58I4wlFyxQLIgvlmnn9mnTQ
	 GKe2sbXvrxSsYZT5rjsWmA15lWuQNmAHMqAPFnqWUofCa84LUcIAktD/3IfZGwoCpHvCZ
	 spouCAj9bgQ+c4s1bc6WhNcLPAhIVyBwEf7yJjLA8ghN5T2enBWGZWAJD9Q4kG//vk6Ev
	 pnlArI8PXTK8TtxuwWjXU7E+I+cjli5i3Re+1PwFukFmYH1u6ypZ1/Z7pTY2xzs+xhz/I
	 uFQZkPGuDpP1mjdBR5czgIPkJCz7trYX4FoECbea77T+8TyZiFODBeDjtqCXxzy5UoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160559;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cMy9p57SoBkXCQK9JJ0rBY5bQmP4zq/Gk+sldtVJuwc=;
	b=LXkTchRMA3D0NNCW1sd2Wx8T2Wnac1r8G0F9wdZx1uqKILppYBRTCba9TTz592pCP+by
	 3fV/padBfBxpMIS1c3ept2pnvmTeFw1IsgL54+HLXQ9xS2qA8DCqkBSxGX/FMEqpG1/Cy
	 XLhqUzd2YAG0YwqoVkIVFDL37IKbIgYwn/r/UJqgGzJ1FcTNS1dU7uampMxyqknUw0+vk
	 eXfL5QLscyBGJKyPszOtJrO7Avvgfg0s7cfoWBf+mzjAUbhxr+JCftoQsE1Z44fBMOUuq
	 sta8n/PTVO9QXww0hqL223wJ1VJwscHaTM3u1x+S9Ik98qGo27/VcDVjtT4wLUj+Hpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j6sqMdt9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XHnZYRN3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C401606A32A
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 07:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C401606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j6sqMdt9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XHnZYRN3
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f0TB1742004
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 07:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cMy9p57SoBkXCQK9JJ0rBY5bQmP4zq/Gk+sldtVJuwc=; b=j6sqMdt9VG0rG6w1
	RMdnteM9zDl7jpL1TK/myEmc0EpJuDI+JvKhjYJXd4oEECQ6Z/JjXjGSdValQPC4
	o+Kx840biickoJC/Q9b9xB7viUKi3wkTcnGD3O/E3g+o1kn065BDmBE9+fUVau9C
	WxBb26PbhOAKw34PSK1ll33sAWnlwsCs66vuWz0oQTrEm7h1zhYCcjb/l1pthJdD
	3W6Tw+N9jv5OY9TXqHl6/eA4h5VNVFYHkf3T6KVIgK5pXglNEqaMrE9HeffE4bxS
	5Wyp5N7fI7YOvi37TL8zl6Ge37rPat0UKoVFXBU2thh3MKvSg54FHamqMC7rxpLX
	B4Rs3w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4ygqdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 07:42:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so974385a91.3
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 23:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795160557; x=1795765357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cMy9p57SoBkXCQK9JJ0rBY5bQmP4zq/Gk+sldtVJuwc=;
        b=XHnZYRN3ClA2+MwlQ3Puo+bhgh2kw1wm8PoyywMaDV1gETp02lPvrDntNilfjA8ytj
         e+hYXGO7FB/N8PchCClJInVtsskSs64ekddtVxLrYXlymawmlUgVVYPLcJJydKVmf94A
         kU3m+GKaxLh2CWFxBBrRioAJ07szJ5FY2b95AOCZi+oh+/bUVI5zugzvoC5rG+ag9pYv
         BObtoQ4BPhcWz5PAQjOLhyo//g5YtFYod6C7oUaCZALods9Jyty/wYwC6E5B+YHxYMt3
         lfSCHBHXGXHAayC1Wvtw/IH/bWBFIi9bBwFjDyKKTCRRRNHgwYqCZuVuO34GJeA4yGNl
         EbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160557; x=1795765357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cMy9p57SoBkXCQK9JJ0rBY5bQmP4zq/Gk+sldtVJuwc=;
        b=22/YsuijjdZuruEEd96EQzt3eqfk0Z0o+b837g4IJjFhBhS94WUPMBrOiGsydsSvO2
         Oub/wSTK9t89+ZUII9B4KRioaocO1+1PYi7qk6UmRhSYEDBRykIhRirzoq5UhESjWKfE
         toZKsC6aoFTe8VKw25Aht0oLa0UXePrJvmBXlZdmWvbps49H27yhjPzJlymZNSEKAKex
         Px1He39gScHhV4RnWYeKDXf8JCMtW3C/13HA5mVPkzLDglr/3rYukhkYXNQKwKKO6uP5
         ttQjiwgknA9qOTL+p7rS0s+znnZNewCaqH6DemEOn/MnTifcSdh6fJXuuq5x8uJ/dXZ7
         aXfQ==
X-Forwarded-Encrypted: i=1; AL+hErHjsGnp7LLoMQ+sp9mTsQLEeJO5+PvP+7gp2v6kxhnCR3miqRD7zU5u9OQhsPCJLsNFfzilQGmkQTo3vg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/cUuUKRuARbuvjy1B5hX3p9iOQ3UiivGWtdF+K7Zk2UGPvUyrK
	OzlC143/VOdhFPVR1+KUnDWsPTfl33A2uhd6eis4s30thV2F6PGV9X0w7OIgzkgZ+Z2fBOCE44R
	Ut005HxgMfL82hAuJJI0cVS+YwXp2AJ6OyX6xEmW/3oJYdbcXnf1a5NiCX9bo7HZQjg==
X-Gm-Gg: AZFdTZcXXjfpIZxgydV2/c3JLHPT88efZyaEq7W48G8NklVZ/3nDn1FYQ5Pp1qtP9ZO
	wN6h39N0ufV1Einy2Yx8ylWhbXXtzCE6fd7Bg21NDP9g6VaZxMj4gPpA32QC7JObcExI0/5+xhr
	gqYeuI5WIbzsCobKAtuD+bE4W0HQTsuNHn5+NFEXYtUYpYW31qeLp509NpbYiGjhCwOpGZZZOV5
	cnr2H47YLTSb2TBBHvV7ECIzM7rPSyagkNNh7afU1PqwOjxZTpAcm2Kujs2nMxT02W6+vF+ALdQ
	m3xrx9nxFo05o/nFecrNDYh8M9p0XDcUMUBR717j6G1smMv7HsHBYmdheR2+2vtiGydyk/EqGJo
	Pl49aFkYCiSDwYD4GtQqxFOeHCoWYzdQSE+692p6mb2A8l/hdkqYMO93hA9IaKDOG/OWLeL5PvV
	S18NrzTVQ=
X-Received: by 2002:a17:90b:2f8f:b0:3b3:bd07:665b with SMTP id 98e67ed59e1d1-3b41c9325b1mr1934267a91.40.1795160556603;
        Thu, 19 Nov 2026 23:42:36 -0800 (PST)
X-Received: by 2002:a17:90b:2f8f:b0:3b3:bd07:665b with SMTP id 98e67ed59e1d1-3b41c9325b1mr1934237a91.40.1795160556149;
        Thu, 19 Nov 2026 23:42:36 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4323bda5esm119935a91.3.2026.11.19.23.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:42:35 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:12:04 +0530
Subject: [PATCH v3 1/3] Revert "media: qcom: iris: use disable_irq() during
 power-off"
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
Message-Id: <20261120-fix-disable-irq-safely-v3-1-82f9561394cb@oss.qualcomm.com>
References: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
In-Reply-To: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795160546; l=1357;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=2I+5QsaOpqK8JscQ/rWi2t79eZPugQinEc5cxAOStn4=;
 b=Wx127EyMvAjyRjgOqzwVx2yiz9pX6rf5qhqKWF/CjT1DMOOOVo5WYVXRERHNye62A7GbjlstA
 Aav2wVNPDkTDr1vrSR7/wTS7Ftb3WXVj+fTKhuPFjETmPEWHdhPHRV0
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6afff9ed cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=f9qQdqNCIvW5R771ZgcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzMCBTYWx0ZWRfX9yaWSxwdBCTu
 DgZro/FMaqjEX0g053JLvBL8BDF157l6w0FEf/oeA8o1gYmtkf8j2NcOsxwxIJFFbggo9QK7ArE
 l//x3YufWfxehaqXGIueDufRqVGTliX+UkiWJN048cRJdi9BYlc7gefcGjknw+/oGTPD2z8X3VI
 yuOJcRj0oi6ZugzA9N95dPgls9+iTWZFCeSe5so/5YQx+e4hEO4ZSLI2LN4RmScFhepxM4e6vFi
 WMXSFL1ar+ki4c87MqBai8xocwOTbp9ITMrdmWDFwYALMxNQ226GCGdCtQvuci3cuYYGEsChmLw
 /55+0v+TmincTim3ZOdjJN8MO5OFBBjBuPb3PGfA4IBFY8ew5ey0makMC+r8LfmztQ4cBsIk88q
 vz595po4y2Xdq98ekCw7yM7geot3pRfUufuBaZZz5CfYeAM7QuaxWnk2WSiMEHl1DEcjNKYQuLy
 fnmEBqMhqne2odu1a1g==
X-Proofpoint-GUID: pRg9oMSltQZQuXCy_3BmqAJ-ErZxZKcg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzMCBTYWx0ZWRfXymsj80+0O9FF
 wRrbamQgqW/7Fgqif9bkokZHZ2Q910RliXo15uS2Y8QxeKjYXPKCmZiYO6kDfujIJtFNrXVJN5q
 MFUIW3MZ27rGBpVFTpe7KeGWHMXUi4c=
X-Proofpoint-ORIG-GUID: pRg9oMSltQZQuXCy_3BmqAJ-ErZxZKcg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200030

iris_vpu_power_off() is always called with core->lock held. Its callers
are core init, core deinit and the runtime PM suspend and resume
callbacks, and each of them takes core->lock before calling it.

The threaded IRQ handler also requires core->lock to proceed. If the
handler is woken and queued around the same time power-off is entered,
it cannot acquire core->lock because it is held by the power-off caller.
disable_irq() waits for the handler to complete, resulting in a
deadlock.

Fixes: b9c2215bdedc9c ("media: qcom: iris: use disable_irq() during power-off")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 243bd845349f..1e183fc4e58c 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -240,7 +240,7 @@ void iris_vpu_power_off(struct iris_core *core)
 	iris_unset_icc_bw(core);
 
 	if (!iris_vpu_watchdog(core, core->intr_status))
-		disable_irq(core->irq);
+		disable_irq_nosync(core->irq);
 }
 
 int iris_vpu_power_on_controller(struct iris_core *core)

-- 
2.34.1

