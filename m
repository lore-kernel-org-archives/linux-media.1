Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319926;
	b=KL4+7a5MLhkxUlapPgog98lIqHT9qYQh6naPtqSreOnz4iCCSxuztrUjp2TaVRZ37SXS
	 r6ZtUY161zotaU+N0oFlXBH+DPJRwADaIUkUw/Z76zMPgvTxikt8HBucCtweYOpVuQ20m
	 8xrFwnbPrQB6LdJQqxyF0u1wxE2hHRCpOuxqDJ4VjxYZIQRGQVA8oHL8O7OePfGzV4NVM
	 l4/7pLiGlJ9+mgG6Bo5IF10hy4yTduplWo2CxP2iBdKF6hPEbgtHg8iH+N+gJlI9qf5Et
	 mVWF5yFGO9bq1wIdXinJowm9VGKQEOwPx/PxW3QRxHAfj0ZjlXYEsFyR1KFY9hsOGqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319926;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2mhps49jkazEfpgVWRSAiF/UKHaCp2mrSjBq5r/twrM=;
	b=0VichZYPpEIu2HSgpPYIEjCfTZxLrISPH0a8bSH/sal6z+yyFczNkDyDegUI0CdrL90L
	 RBSgAe0QnLGg/fMiqRNASgdJD2Ryd2i+vY7N0BMmqb1pH7xAKSu5BqVD2fNQjwye9AgEq
	 mpPdax84r8moqMgCcJ2VXAnqUtwMvDsreeD/lz0mT9JQSNaR/8Xubz/TYcAztNcfw38q+
	 vZpLAWAwIFgAsvFP4dfm1dP2ys1iRyJskQbNt1d5gzFHgnpGcGFYYG7lR6xs3CTME1dNb
	 i8S6s731fYL2fez5xUZO01RWs+2N5m8CQTkozsedy817MSBOeZVGpcKki0vV+QwAyWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mM/jPauF";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QMdFysQK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5EA606A332
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 14:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C5EA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mM/jPauF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QMdFysQK
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAVbY3840129
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 14:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2mhps49jkazEfpgVWRSAiF/UKHaCp2mrSjBq5r/twrM=; b=mM/jPauFksBQ27Nl
	vJFbuBZBpaRX56t6K17dYrYBsf6PnHvo7BS7hnwhdoeOvnliy2hNNkTEcOhDvqwu
	zn9ugQSwBs94XR7EeZWmVjQ5tnY1ddU+dS2+g079Dzn/wbCYbYGem9lbInM0mpvW
	b6n8dwl9sX+5OjUuEDTmmXzlPezQ+s0D2ogzz0UuIP4JY5UksscN3meF6Z0q2o35
	KrWHTQie4rju/XEOJau+cMjt0cfxWHwhzU4a6SkFScOtK6CZP1vxFGCwX3S83hU2
	nGAQI3mf4E68iv+nJy0vcNk/3N0cE9UGuRGbj6jO7863DLWCHw/514zb3FWT/Y00
	hJSQfA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg3qjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 14:12:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36efb506f29so2082564eec.1
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 06:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794319924; x=1794924724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2mhps49jkazEfpgVWRSAiF/UKHaCp2mrSjBq5r/twrM=;
        b=QMdFysQKeSuRHTDSWYxfErRMlVSGw//aKZDn1sFdUF1S7euKKW7u/53iTNzDs6xkG2
         JuZPulbn1yAOiq2+U2fDkYaaZJ207l30BIRvxKaRbEkRyRxaT5BpCO0/rT04B7nwFtDH
         Wg3+LRwjfwJqQjAJ2nIlUMkzu1r9hcMvMQvy2CX0liuUbFp6XMyoB0NkRrAbZ6pQbRqO
         6tIIW9OK12xqfT4RgmzWnhuq8KGe+zdu/51c1mjqbgc+FLjzrJ8xzisAqqEl6qkz0Ahu
         EkydGgcy7AWuqz3OolDOmRsWCHXtTDABgfQAt0WsYh3P0Wu5oDEFO6uJUiY4fJw6lG2B
         7mew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319924; x=1794924724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2mhps49jkazEfpgVWRSAiF/UKHaCp2mrSjBq5r/twrM=;
        b=WzNhhcOs/cWAHUozcBKipuVKGyTyEprCPH2y4yqaMlhBsHqJFWUKuw7Wo5xOB+muHa
         cvTVwU+PCnKQWzS6X72J19hLhHcy20ZhsX/6kkYYhfTru0YfHwJZ/4xtKtxyPByCv4kl
         5pFNbUVWigTIlKAYCTEjOKZRANWFxRY/Ivg7yXo1ghgiJNAIKfEn1z6dSrQ42ROzfvws
         l55Pd+CV4VLXiL/0jwtTCuqv3/mYy6kN+6vCrD/3LMzS9ZLJh+bhoY3KZR49R5nVOi/z
         P8yyDUyJB483MuaHAT0Zuctt5kifhPcl6uHt+qDg6BkABTzU+5Yp+qBODa22DRqTYx+L
         LW+Q==
X-Gm-Message-State: APuU4Z9b+NnhFjP92yme9/Ui6xhgc1Uu9VvvfQzYmygauaVdA1Afyf4U
	tIKoDcnCrjhXaGJPmGXXi5ae0HmRKObAtdkR/QlgcqQntvDAz7MIUmtxciMxcTUZWtxWjsH7kBW
	6MxiQOR2meTbHEZYu4LbUotizXKv+d3jLA2CjPH+x1QBRZ0s5/FSSzFKBa6dysfv1ag==
X-Gm-Gg: AYBFou0d0eUyKOmi5Qwjv7D4fbZ76XZ+2s4AhbO2IAy//PlE3d1WTinNr4eJNlR9VAm
	59lp+bMZjpqfcuqiwQPmx5Ml1/eFpjqp6Zj4BJaEjVOfLw+0EAs0NJsYZYCNWZOtLe/e4FvmPmP
	U1VwarWvZ2eG/e6FLs5HsFSzKV4YDDDTtbv6OMrzS2Lzh/dtgVXxW7ipeWE2ku54UvyWSoY8YQC
	nFrfOc03kDydhvVf3xJPJSlgk3WV8beYKrHJp/SWmJnOWS3dl07WJTxU0xMGM2gyScg4/15kqzB
	VQ4drH322giiJ/ouDVt+cmf1fM0u6vifdbyFP/A9cD2pi4h21PZCsp1t6WDOtwGidtinETweTsj
	pxKaoBxXYGBzqIlLq/tsyQRMsPCDlbfk1fjpjugTjqveKSEAa+a9Xe62bfmnTIRJ/y66Hb3Mlak
	aE00LL+Uk=
X-Received: by 2002:a05:7300:cc83:b0:36a:18e2:64c with SMTP id 5a478bee46e88-3751eb8a9c7mr3451757eec.11.1794319923863;
        Tue, 10 Nov 2026 06:12:03 -0800 (PST)
X-Received: by 2002:a05:7300:cc83:b0:36a:18e2:64c with SMTP id 5a478bee46e88-3751eb8a9c7mr3451676eec.11.1794319922726;
        Tue, 10 Nov 2026 06:12:02 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm8059128eec.27.2026.11.10.06.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:12:02 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 19:39:53 +0530
Subject: [PATCH v2 5/5] media: iris: Free the interrupt in iris_remove()
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
Message-Id: <20261110-iris-handle-unbind-v2-5-86d5f6f1dea8@oss.qualcomm.com>
References: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
In-Reply-To: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794319890; l=1091;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=jIb2ycQ3moYpdaKxeD/lr+k+JtQ8YBIbnmK+M8ixipI=;
 b=TbDLgkOUwKMhe4NZ6wbIy3aRKhV6wvsT4DQz52wV913++1AVqsyHCTkZJ8guxxsBmE646qDPd
 qRNWEfzSd5GALHgQzZuwWrBPCzsFo1GP2Px1FeL0mpfUltKUfq5GHvM
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfXxWI3Wr51aU7t
 OAHD2IdzGwQWmaCzLeCCzTKNtDaUVs38eqHt9Gvtv3JP0BKy/DkCBHSHiGX2imPr8lQVyFbpi88
 PzV1rNp1UhhO2VJlJz7NnbkqXXByzJbrUMPPakSxb/ktTeCfCcHNogYYiSHLrkQUXy6/eMYvh5U
 8FWRjts78fvaiW3z9PqFcPQoJIq66K2hiODgj3kaN3UvNDdaShkbqmwvBVEpCJmOgKIcJGbKiv7
 9irSYgyVytS1Z60cKRdryEfsde8iACjhwuRF05z+FuuHtOu3aIyruS7uFm66pUQ69Ynrd/r+YJU
 QxLeZKO7H3DZWDE8Znk5sIDr5TTfvYw53fwzTdfmaAkjyO0bnOIuK0lJyWvUsk54HT0ib6WQ/Zx
 4ynbulLl3qfeDBqJNLjY9CAfXk4qbWkN7Yn8IY/pQQouNxXUekxOIeLf6iXWiywJrepDHm0zam/
 q8nu8LCPC6vn3soOXPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfX8Nd+I03dzurX
 wAZ+3w0Kyq1L8igsoa1ungytXTASJf0nT4pCAeFQPEOOnyqvl2RB/5nJeLpCYMtXoQYBOpxxinY
 wyPqrGJaUdMSa74Iwr46MWJzVs63t6M=
X-Proofpoint-GUID: u-1QtT-papwMRhULcW4Vv7-65vHYupKc
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af32635 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NKppu6mipZSEaVxE2m0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: u-1QtT-papwMRhULcW4Vv7-65vHYupKc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100056

The interrupt is requested with devm_request_threaded_irq(), so it is
only freed after iris_remove() returns. Until then the threaded handler
can still run while the rest of the removal is in progress.

Free the interrupt explicitly in iris_remove(), right after the core is
shut down.

Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 51054862bc64..925a450a8597 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -292,6 +292,8 @@ static void iris_remove(struct platform_device *pdev)
 
 	iris_core_deinit(core);
 
+	devm_free_irq(core->dev, core->irq, core);
+
 	iris_instances_vb2_queue_error(core);
 
 	pm_runtime_dont_use_autosuspend(core->dev);

-- 
2.34.1

