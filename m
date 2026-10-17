Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB09D3C1F43
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 03:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792207016; cv=none; b=bTfF8F9JmRsngg2z/1hRpG+zHt0KuTBRRAC40gv3YF8wgl0MUMR0z9RQLJIz/Crlf7JvShPRm9splaac83Rrh3qyWMJYhlvRT9H/01YmY67HcSHEqGBthrvmnWW1Q8RJDWRaGtDl7qYESQ5gWfWDjlgH7LPSezZS0pgNGb+xAxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792207016; c=relaxed/simple;
	bh=PJj8J9KRV41mT/Zo9ZKQPf84EZKvgNSf5a6l4m5+x8Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fK4KBk/SIg0zorELKGSiyGSlDlJFgHxER3gzd5Zg27jyE7zGulXp+pWTqRdI1dCpk/MW03A/seX6ygMTxtJZnro/QkuQZMM6dS/YbFEoHP7Lg6axvZCv8qw2WKmg2CWl5cqPa2VjbvF5wR36R5Z4DN9juPKKKxYUd5xB2CY9bEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RZR7kqzO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AAoOXj7M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RZR7kqzO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AAoOXj7M"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30etR1010969
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 03:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pOvt+GYoXg0d5rCWq6bN0D
	pUTER1DOC5PPhMFgzJ/IA=; b=RZR7kqzO4XCiJwfS1WKtKlNcfuEreM2iPBJOu6
	1wgeEkQSByLaMw8l9E0LyfgeWIiMpd1dDEVldVMU2EvfTJvQ3cejxd68vCdTD9a+
	G9MV8cei72D6KtGa0cuRVm+Sde6vYv2Y4yyD0/jhDSvek+fCos+WRFscxTlFN0mm
	TYYTQdNvYKyuLlibttqJlyZyRY7NMI5ZL45/WUNqZ9u9JZkwASTrmrPqHvQ99lr4
	IDW/h3D9Wh2pEhGWXDElXrlgnkGhHDNMhPYkNWVn2HCTn2V2eIFAGqYSBdlHSlN/
	JJ4DwUYyWaIhRlR2/8pF5WQzBi6T9bx+VoBgoG4m5XLHmmYQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxqfr9ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 03:16:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso729538eec.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 20:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792207013; x=1792811813; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pOvt+GYoXg0d5rCWq6bN0DpUTER1DOC5PPhMFgzJ/IA=;
        b=AAoOXj7MAZczCw6GtkDBvxb7vTfpRzLsHGepRjdOPTlmpzdmNIOe4g5aUfXqzdwqFQ
         JSlvy3Q4Wg40zkxRe/38HpZ4c8/YY29AxHoFWGYqmEJqIL0j+6edxSps6x6yCVxdCpBJ
         EvrGx+VsdD9VWlazvCW3Hsk0SlBKygv1laxubvqmbPOCGoGdqSA8jGXGs5X99mff1WCy
         9aUCM1WTGHZNxfMkCgDDGbgkk0w2sJcCC9KsNNcjj+EAHctc+JvOSGaF1qsom2UOMjRD
         I6fK6IBDUn3zcuzLAZajzSkUf/24bXOI7TbUX/je+dtjKzDaTiJTvVM0nVYyVZ6eLfHk
         0Bfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792207013; x=1792811813;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pOvt+GYoXg0d5rCWq6bN0DpUTER1DOC5PPhMFgzJ/IA=;
        b=g5MUV2Yj6Is08CLev/oiCtybRKKFX8uaMvnaMXRF++939axTEWHBjE/ZuPCEMchOrg
         qbOqatNd2xLmh2q2ir0+DvEKAqZvhTiGnEGf0+upO+oIRnU9CXseWWYUJzYIYlLw6GfH
         FNeSJN38BgAEXqtpN7zgD1bBLDGDX4SBMwaSI62re3RbCnUMLwO8PjBM97y4zvhCjJvV
         pQP5ED9tHi4BfdyhK0OQMqSrsJih4tEycfgDjVd7tJyXtZHk/gLyqpGb/5k5IE/g/Cmw
         FJX9SBJNibZBFncBE1PKZRlyDoPlejJyYHbLx0QgQ41megtAyEHBrNbD45BqGJwA7RR4
         omGg==
X-Gm-Message-State: AFq9FYIaXmHBvbdWfAiOtFced+0sHBx6KHds0X154O98v7agHiPXx7vn
	32NcqrqrXQk8ELTWAlN8tGt4BLNAXylQW77m7NkbF154KEIkvtYcZ5iCD7YnELnHkWm9Nkw3Gcq
	/wZUPtxw66wuLd6ogUzsmCGUNd3as/NP9twjLU8aLNG8tAcXphwBwzofK+ELXm1IHIw==
X-Gm-Gg: AYBFou1aYUyS2w2tcS7M92SbtnGdfD+0ulnvRB4JK4wFE2BzNd/4+1B7zFbx7BJPDfk
	t0NSqZCFmFALL4b6vGIjdSZv8jEbTbmdisUQc3gzzPcffCu62jjkq1vBtm0c55MsiyMQDC2O9I7
	cBDrxhpwIWUTJyADFlkpV1F/uJuFsHr07omi8nN8V9RFwjqNLKhSRXLSzW9HrDZbsNTJXcAxi+t
	3v1UUQGLT5WumaO6RHWbdCgXzZh+6eObY3wq7hQLr+KF3mBmnn7SxvXM/DEbOjRIPQIqPJUqwpF
	Rgm+6jSqwjBnrU848zGBEhlyTse+dbSdSYnq46pLK/GNG3jHIJEleXeOQYIKtejMzjGe/1eYA+e
	UIUZngsA8Wn8lu5fSYG1AddM8zPTDY4jIQA==
X-Received: by 2002:a05:7301:2727:b0:34b:f456:25ce with SMTP id 5a478bee46e88-3619f1fd67emr2511976eec.3.1792207012913;
        Fri, 16 Oct 2026 20:16:52 -0700 (PDT)
X-Received: by 2002:a05:7301:2727:b0:34b:f456:25ce with SMTP id 5a478bee46e88-3619f1fd67emr2511936eec.3.1792207012322;
        Fri, 16 Oct 2026 20:16:52 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0d391sm10969995eec.4.2026.10.16.20.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 20:16:51 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH 0/3] media: iris: Fix issues in the driver unbind path
Date: Sat, 17 Oct 2026 08:46:16 +0530
Message-Id: <20261017-iris-handle-unbind-v1-0-7809148eb90f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIDo0moC/yXMUQqDMBCE4avIPnchsbA0XkX6UM3YbpFYsiqCe
 Pem9vFjmH8nQ1YYNdVOGauaTqnAXyrqX4/0BGssptrV4p2/smY1LkscwUvqNEUe4ILcAkSCUDl
 +Mgbdzmh7/9uW7o1+/pXoOL7kLswDdgAAAA==
X-Change-ID: 20261013-iris-handle-unbind-fe09689e6696
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792207006; l=1489;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=PJj8J9KRV41mT/Zo9ZKQPf84EZKvgNSf5a6l4m5+x8Q=;
 b=YcsMivIQ3/0rvCbuqxnOnol9ISj4hCVNuJITRCqsmxQfBoD7MfIFmRR/OwkcqDyCVXeQTQGDx
 aVdtx+MrY9PAsmvVMQHYI/Fg8fRYX5aPSdXf/9f/KpQXjlVv7RRlCiF
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxMiBTYWx0ZWRfX1TPXmNhdZn4+
 OnKSmh7Z1STz1LwlTv6oO69g5pnS8c0434PldoMwGV3AhdXVRCHcUnblkhrNhB3I78d8umLR5oe
 4uvIHZQy+F3VG5O5Ircwxw1sVMYvjPM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxMiBTYWx0ZWRfXzxWo2YH6TLRJ
 bkFAvk2zoOX0Q78F3bX+w9SQVTeYmj9pkM1AiDozsuAW/UA+J5rp85rUPPL2KdTJRkM2Nq3Su4f
 YfxdyJ780BZ1e5UXUaDuCGIUDxZmCGEmGW61Ej3bWShSPDAP04Ti5mrJ8h2+0+irBoboJ6fhok9
 u67y6ImcailDd3WeYFxSIw3f/BEFuwvXzp1uXYfqnatqjxUr3luMeTs+zl64NTvAQZfE2PX7WOw
 dfg2+UStHkunNeHWdcbgM0ORkXPzD5vDDiPlkeUmU/QO4AZNmRgGfdiyfwE4K/s0WaNdxk7RABT
 oArakB/NtGklNIPy82mvC0kxpiGmvXv7dG0/fmN4oFijQpbJYsdPh3Hy3Mj63jzJ0DG9nvBl+MI
 lOinjKYC/fFR2xsuhz/WWRpb8bKW321gTaooOzr/VqtN3KOu8rh1usaQX4+uAllGSxY8cr+gcss
 4RDkrZ/0r6Cv02hAvFA==
X-Proofpoint-ORIG-GUID: CZk4I53zBrEIzHbn5hmFyKl19-AC1NaU
X-Proofpoint-GUID: CZk4I53zBrEIzHbn5hmFyKl19-AC1NaU
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ad2e8a5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-unpW79DR_kPSW8KOtoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170012

The driver unbind can be triggered through sysfs while a client has a
video session running. The devm resources are freed when the unbind
completes. That leads to use after free for the running sessions.

The core and its device are now kept allocated until the last file
descriptor is closed. New sessions are stopped as soon as the removal
starts. The interrupt is freed before the core, so the interrupt thread
cannot run on freed memory.

The system error work was only cancelled during the removal. An
interrupt could still arrive afterwards and queue the work again. The
work is now disabled.

The runtime PM usage count was dropped twice when a resume failed. This
happens for a command written after runtime PM is disabled. The count
underflowed. The reference is no longer dropped a second time.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Vishnu Reddy (3):
      media: iris: Fix runtime PM reference imbalance on failed resume
      media: iris: Disable the system error work on removal
      media: iris: Fix use-after-free on unbind with open sessions

 drivers/media/platform/qcom/iris/iris_hfi_queue.c |  2 +-
 drivers/media/platform/qcom/iris/iris_probe.c     | 58 ++++++++++++++++-------
 2 files changed, 42 insertions(+), 18 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261013-iris-handle-unbind-fe09689e6696

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

