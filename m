Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088770;
	b=ZpgH/wXpM+RFakPiA3VzgDXfnjRv5k+fDoBxiXkKEEl12orinJZBy7ZcS7kB2XdJD3jf
	 fX1+gdJ7j4Q/n7uitfjsYPSM8A/wHeGNuiyDN5oi0+/pPaxX8AhUseZ84AG35fkCC/HEH
	 xh+pFqYzZwSyel6FVPiegmmD5VuSnJacpggkcsBs9xF3Ubus5Tl8gtnFBLLECABAEiUXW
	 q1DXJ1PjJElh1XzSjcU7bUPcgKwcba/fNjQglFvG0pm6LST88Ozt+qL8zhrIiIDPlQASU
	 dPEamOj8BpPI/6AfZJ+pnTzTKTA5el4rK6bnfLaf0SNBogelogXAnYk+ybbi8i7XKCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wJi2Dix00w5C88YTCv3ugKsyJiJdnkq9AkYH94vYW1g=;
	b=AfR8IoeE5uZjj7miPLj0+eonQ1ILh0SERp4QFhCoptGX7jkIbRX/tSNDWB3wgLl8d7nR
	 xiiO2miifw6tEyoP/eYyCm9z/F75e6TjqTw+YliEzozBrgMj8uh0MPlvVaNVF9jJOtZOn
	 Mi+Oofhi265MvBxT+lD1b7l98H96BwnKk6V7S4iRgObXkTLBdIh1vGOGnaJJwwu5m6j0D
	 k3G7GPGmXiSHS0v8S+e4puEhbrou51Aa44++nfdwaY714tPxZCFcuDMpNoUUIdJ5863Ll
	 2Fkv9anJNTbtpKPZp1/CXGy6JFjz4OrvCBNOsurIZ5bnqgJZ4coRRauTdzKuIshByGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qk2Wfyjq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AI2l5OzQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A6D606A33F
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 11:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4A6D606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qk2Wfyjq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AI2l5OzQ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBjr6s2179409
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 11:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wJi2Dix00w5C88YTCv3ugKsyJiJdnkq9AkYH94vYW1g=; b=Qk2WfyjqOsdNzhvy
	JUjGzXrMV4EL89CcRva/75hT2gBy53M94wYUM7rHhZ3eBrgjmQlQr5BwtkwIlSbI
	z/JAcVGZNQgWTe4ZRg3hbXsrBhLWzAxaXRTXnESpvAQXeq7sfe+J5pQLMu+90hRh
	j9ok5yYH2OWHaOC8FGp37wo4CWmcNT01v73BCKXbOYniQbcPW/W3yMigODeUitf5
	yOLOFZgI8BscbVg1iNsdomdMihqi/zF7j+4tB9uUJ66RCamn4F/LaL3tdaKSQTFO
	YFCWKV74TgAxgV8KATWll+H1myxvX9GUd814A9THrPhC94j5uOBN1PN+SpA8eI76
	Q7rH8w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1yx6849w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 11:46:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b40e7f4fa2so388537a91.2
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 03:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088768; x=1795693568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJi2Dix00w5C88YTCv3ugKsyJiJdnkq9AkYH94vYW1g=;
        b=AI2l5OzQsmStehqqf7FovbWLHt1lGdjFm1vkzqJRJdhh6uFcElkdkCoZq4V29CqPXG
         hw/HTmdx/WZVcqr95jI3nFjigjbZvEwYxVjUHUIrzgYdhYCaxjy4oiad5PaLYn6wd+Ud
         ZDahYoCBuu797nXhZw0GqO6c5jgAE9YYOzpJH9XO38Bw3fAh3H6xMedpC+hD6qnIRbi/
         Xio7YWZc5yrSoW6lLK/kmt+RLtf4KMY5WVIxvLgTyOuziAckFhFihn2Ja/34KerIg9ux
         O5XElY6Az9p7SZLJ7Lq+i/eb0QsmFz2JU07ucXumWL0MUp6V8zBs7Xy9ehS3EUCShC87
         GLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088768; x=1795693568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJi2Dix00w5C88YTCv3ugKsyJiJdnkq9AkYH94vYW1g=;
        b=ot9DVcHxyS5TRpndK+pCMUfHhKeWALkTudey8cPD4I+AhMnmY3qmr8mzdigBv5pB/E
         H5WAiFtGOQ/YqH5Sa8gqN+oJKBL/+JK6dcgZGhcA6AMTc++IIrxzR/3+DH5aUbIQUNVr
         rcydu4rwG2CLY6MSK8gzcFau5OFZm7QvSBE3yj02jb2ilogfGgjshR3sKrPCaTFCoj0r
         686NQ38lINlCmUEOfUs7iOlB2wUusg9Gdp8UajVgbOb2T4RWGnNUc/Su9uqMBlPyedmi
         v70wcUDa+/5a97PxrgwPJP0plFdnyKC/5QnhvnUCsymFbRVsZrEGwSydM4Ud0q7SHBln
         uWXQ==
X-Gm-Message-State: APuU4Z9HCM0TA+XBGfeSitekZxCLInc1dXxO1X5M1aYBm2CZiF8EEYem
	giRfvQQUwStavv3Ru+aek1ptfA4hcTAgyYrs78MqYYHe4GVBmjMJvi/yMIZTe88ULbjoRKdcBpa
	KX3E4dCBS1h67LrPl8A4YgU8pXsxD4O3OOoKKoFYciNr9HvRQOUa6hSEzsCpfYLsoig==
X-Gm-Gg: AZFdTZd/lq/YNDQ9+QiRvFUmZ7KLX7xEyYk/MNzvIUb0eg+c7zk99N71CCJMwXKCxaJ
	PDJLCZLbxTUQ6n/6i4vX5pff8j1KwG0/4u/7DmMqmwsmaiRlol+IAwsgH9f+R0CpN5Lqbu/jhei
	3DtWqLuKg+ZYwJdXeOLl3ud4sZfyPCE2SOrl1YkvafNQPJSqhoR/GjB922cRn/eRee50L5EBpZU
	2wGNYK40i0AWrUHsVFrKkxMR22jf3ySKtVBgb8EXC889b23v69iCkTcwl7LfzYfEtPbOjFlZ+DZ
	lJ29bnsySoPZM5g6bXikfg9Iaafpe0LQp1W5H2wFNZzz5/Hr0cTPdui+GQmk9ogWU56kmC2CmU8
	xCtwHpa+OCGXJnIcd4yjkg7iEBS1MeXE4s2O/60/S2+E5F9zV7iCW5k4yDtK0cFD0bj7FAhqG4K
	xlGAo+jnA=
X-Received: by 2002:a17:90b:39ab:b0:3b4:625:3d2f with SMTP id 98e67ed59e1d1-3b4062542fcmr1235303a91.55.1795088768165;
        Thu, 19 Nov 2026 03:46:08 -0800 (PST)
X-Received: by 2002:a17:90b:39ab:b0:3b4:625:3d2f with SMTP id 98e67ed59e1d1-3b4062542fcmr1235274a91.55.1795088767648;
        Thu, 19 Nov 2026 03:46:07 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm2397030a91.15.2026.11.19.03.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:46:07 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:15:31 +0530
Subject: [PATCH v3 2/4] media: iris: Disable the system error work on
 removal
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
Message-Id: <20261119-iris-handle-unbind-v3-2-52d467a13907@oss.qualcomm.com>
References: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
In-Reply-To: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795088753; l=1393;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=mTtJUAW16Pa3NLyR5lT7gqKE4xsReqod6ALEVe9NOI8=;
 b=qzfbVbNGl926ns1jwU1eo1xUOzOesUEsM7o+cod4M4Q0qd3oUHRbO/obYdGhiGQv54XoopBD5
 5zc28B1tTIyDRgxNQSjQm8M9t1GmHC4teno/zUH2Gr7apB5AWqmwdpZ
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: zxnN-3a4TBzHiLfQxFdd9PyFh3nhOyXM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX5FxQUoB33HzE
 mU+n6a2ZhhIKfiuRdqqZGklVFmHUa7KBL41lCLcq3kFFP1/pk06FPQlXNZv4gh26YYKZQGM8JT6
 yqEi9wzp9SH+UXM6geJHfgNRPrkrJt4=
X-Proofpoint-ORIG-GUID: zxnN-3a4TBzHiLfQxFdd9PyFh3nhOyXM
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6afee180 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bZa8m19-NPAJ73ByzVcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX6dF5Hb6i5dO4
 twCtSMxrL7wPAPiokWBPWlcg7573XgAHTrQrWZD5lzGlpnrnMZlOHYslkvC0d5b0dbDsFPxr7Zv
 c3c/LleWMCH/q1uOXIjKkrPxZfp8pBt8oVc9G8gEinm85X2SGsZd3+cc9d5t/x+8gbcsZTt0Nae
 AgENkMjLZR0gIMo+I9dJ14FCxAI2ve0W9xDLUV3QB/IOxQK3ujcfz+A6p/GzkXFIu60Td+0Vbys
 03qdBC65hjJOuL5fYR3XiKRfSL+YYVN4+uDHBDa6h0lBFXGjEiqgbsNaC43ru8dxwDzE9KYDbY4
 DXpJGHN7bkepvG4XslkjE6ELpkgUcCCP+HFQfcDn49Yf6/mlAcMythXcxXiISDg9ZeKWiBjEU7c
 piLzSsqEoyLKzRk6ez3GE3+MmBaWVXg5ZaQg67Q3bC3bxSim4P/6MDlW92Y65RTDJk8p8I7wGva
 zhV/jSGhp7xh2CJ+U0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190046

iris_remove() calls cancel_delayed_work_sync() to stop the system error
work. This cancels a pending work and waits for a running one. It does
not stop the work from being queued again afterwards.

A system error interrupt can still arrive after that call. The
interrupt handler queues the work again. The work then runs after the
removal and uses resources that are already freed.

Use disable_delayed_work_sync() instead. Once it returns no new work
can be queued. The work cannot run again during or after the removal.

Fixes: 452480931648 ("media: iris: cancel sys error work on driver removal")
Cc: stable@vger.kernel.org
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 343e44c6b9c4..6f02bb629867 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -251,7 +251,7 @@ static void iris_remove(struct platform_device *pdev)
 	if (!core)
 		return;
 
-	cancel_delayed_work_sync(&core->sys_error_handler);
+	disable_delayed_work_sync(&core->sys_error_handler);
 
 	iris_core_deinit(core);
 

-- 
2.34.1

