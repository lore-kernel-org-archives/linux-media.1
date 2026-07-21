Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333363B7B8B
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600444; cv=none; b=SvMlr4eQRjpoHTBTb1ftxMF0IgcXjuRqOJLeD/Kb5OSYuSpKwbehHA0WcF909mSw/Tjs+qZEXrXSjCGsxzIz9FHyXOk8+TZl4IRvM20/GchRN4+xWl34aE1X/p3zXsaOCA0zYN7Ae//RUaBjcVu39IMwoMiZOYNBpULjigRek1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600444; c=relaxed/simple;
	bh=iwFvchubbplrBbnNj0mAwm4NbMU3t1jTzwIydZu1Ex0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mElQ6WboVESSntZTCmIPaqL8hTtlGtTpcyL0Io17yrdo4lqS4NyOnFb9UIzYClkam2Cb1nrvRqqNxhaEVgBXYcc2lq4JmXeUTyBeIE8/YDZ53JFqNnA7BDnIdw5LT0ORn2xKPK1PlFOx0eCCyTaGkfMaqB5jxvjorhkhMzkkuYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D5d0J6xs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VOBb90LT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5d0J6xs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VOBb90LT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCMG34106900
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:20:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=p61/RZLjYzmP5+a9xwm2ds
	/dbK2qk1DvFh5tJPtswsw=; b=D5d0J6xsxieogeIT2Pj0tYBrsV+3bKvfU/el0t
	kDt7b+Fde8dplE/fDKWwRot1Vjy3tl+nHaLwjvDqrEjGBst9uOc5j9VOj+t1Bdmg
	0u9eDdUZQX/E2iBKwRdXUKJPpVc51TyYn0w/7XsHH9aUd/wNJDVnahE4S38SCana
	rHiutErqO+UQAY3JacFBk0+ZV05f8OZOXdgKeXNeW94tfS2F3FIcXwy1j6slUzEF
	/odgN4NpN86i5P3acD4C3D6zS3s4wfJBdfyRH0Js7o8TG7OdYGIYK8AMpMyVnrbE
	z/QU8O2L7//+BHctU0Duk7Pbaj/kx3yqxZ5LY3USZ3dbY0ng==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqn8kf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:20:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e667368f0so4361263a91.2
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 19:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784600440; x=1785205240; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p61/RZLjYzmP5+a9xwm2ds/dbK2qk1DvFh5tJPtswsw=;
        b=VOBb90LT4O3TxYoNP8x83Sk6I5NntjhOPb/NwV6O9SQBpcdMAugY9o4axq+5M3Mwou
         2T2PCVP/mmfMQ2Q97zcYez2c2/5wpe7tYGnG93JUqP/U5GPSiaw7qo5QfV6l1O4w/AHI
         dIAqS8lCpepfsGG5/LClVzwcVSxWukcxPJ9T05MVqByWeTsMM4/ipnAFvkBhJE/YJw3W
         Iz+vqNKCe2rcZHWb3Z33NklmiJxsS2YbUYXx7k80VjmcxA/jb9VrNzqX3flIkFFlWrVy
         5vMHYPUVkrcZWbwaq/XJM976YZ03NYzCd+g/9ukf3+T0ztslV15fTSxyet5WKAzACi9q
         9btw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784600440; x=1785205240;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p61/RZLjYzmP5+a9xwm2ds/dbK2qk1DvFh5tJPtswsw=;
        b=Q42y4JxswJZJ3NBjRG+SpRsdzObvDhe46jSkwxz+CwR0NoM1nC0rt5oldJCPEqsHoE
         Lt223T/f73C2PQ8arngf8yCSwmxWznoxEVUmRTvjeE+zvSxXLPxoRPxd10uwgeixo+us
         QYwEMN4QanzTk3dBkU95rguLE7RN4W2e6kOd8fo/auCYQg6NcEJ6SoTekb71Zsecds1B
         zryPw92+RcG1qedwkTZeGyqHtJFyWKVmLx0Durtt/WViGGqxzWt61nWuz5xYJlA4cLO+
         sM5j/LmbI/8nDP5eRYTn+gLjX4f5cmsvU1/+0e5V/E9vskAajct5jqi7xHtaGh8rUwyh
         88yQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8Ml5/zz7IvTs6JRLf9Z5WCNmqjA4+ekgVp37g6oFxwiDUr4WeT4CmsbYFLMUx7rfnROUn8TgiQT9K3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDOJ74nRKQXekoaYBVKkG+9twhyWgkFonZ30isDZnJVwCHdBiK
	545sgTS0BB607N9l6CiQbfTR1iCdne2CXhkXMNX/CQ951jVbEGiADAFLdvUs7L5C1yET4gF6iHl
	Pg8LS8ffWZWG4A4Y7XgqE6Jg4+y/FbfjAyfwtRLwuPGt6qQVmvd3wDk5Fogd/60A+v3SBa0UGOw
	==
X-Gm-Gg: AfdE7cmr8fkM1lRKIuWqs3ZAApVpsIUZ1uNA6PW2/wH/6rcWiAvTRfbfPczIdNb3NC9
	6+DYFbwoQWSvnc7UYwvAAQptg9jPSK0MQ4d6QyBREPgggEoOjytnaSRkIbHz3KRIkmxCsMW91S8
	Qq9l9f9TKGp0G6AB+pdSMUBGVcMLr+iGC77tJqT6gNc0v1hEe7PH3QMrDzaJrVSBS1rbgIwtURV
	EDo+lpoxVLumU4c0F0DLd18dg5eMPu42u13bsJy0cbXB/Fl/1NZzAWOSHWH3i5dCFgFabmMB/BA
	w3tBBAExUREeJ7e2iMWMn7NysEEszyXGM2RCc0+PDs0C6KyeJoh3m0zAFoacW0/6rHuUdlaLamm
	h1E/7oeT0Uaf+DcvkR8j9HRl0fJVN+eDlMQ==
X-Received: by 2002:a05:6a21:114c:b0:3a2:dc51:458 with SMTP id adf61e73a8af0-3c3ad8b30dcmr17441108637.41.1784600440632;
        Mon, 20 Jul 2026 19:20:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:114c:b0:3a2:dc51:458 with SMTP id adf61e73a8af0-3c3ad8b30dcmr17441080637.41.1784600440177;
        Mon, 20 Jul 2026 19:20:40 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm41001457eec.24.2026.07.20.19.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:20:39 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH v4 0/7] media: qcom: iris: miscellaneous code-quality fixes
Date: Tue, 21 Jul 2026 07:50:33 +0530
Message-Id: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHHXXmoC/yXMQQqEMAyF4atI1lNoqyh4lWEWto0awVYSFUG8u
 9VZfjzef4IgEwq0xQmMOwmlmFF9CvBjFwdUFLLBalvrxhpFTKJ8CnmYF047zhhX5Spjg9GlC6W
 H/F0Yezre7vf3t2xuQr8+MbiuG9j0onp5AAAA
X-Change-ID: 20260721-iris-code-improvement-b412d103bd3c
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784600434; l=2684;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=iwFvchubbplrBbnNj0mAwm4NbMU3t1jTzwIydZu1Ex0=;
 b=DqpxZ0H0jToXBGx62yHxjnl2EE0p3P55elS/7rSTXQlSA5XWy0Ppo2YM1h2UMvFPdEBwCcaaV
 xy6LUGPIO7GC4qHh3DxO7iWSByXarhyd2ASjnMxbAsXryOa3fuGBi8G
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfX2AN0eYyBNjyn
 kOm4KJ2ca6D/3DydEGK79siuDbvTylxwTFx4gdVlaiNoAgI0TCAF3HEtEX+FIa306XkX0SS/Dco
 OryLbOu+sqBSTfGIJhHWnMc7QoZkFCfjpry5CIMs5LbiG2sqcvC8/SCINn5I0w574VjyONernDi
 CmgWxSQRCOruvF+AJPdi31wX9zLLAmU+gMzqTIF+H25mVp3qP18dH3Iva9MNx30wvfsHfHK6g87
 kKs3+EiIWx9jxPUbDhUvL5ySOa8m0LD+sOTWIji3sikySsheBvvBKOEaaW0Rv9lyJ9u55Ducx5Z
 orAzA8I6N9qGUKawOk065TQ0XsBt5yLlWfnoR8C/q+/u1ZQLwnXKS9lVPS0K25vQzZUoYVMQaOf
 YwDporxGVabnPOHTAVkEYrJRb4rTeZUHM62Tc1GNTMUm4rd5CTNKOx7aIQeB21iqlVJ6CHOfBH7
 E9rAOiDJ4h+QflJbiRA==
X-Proofpoint-ORIG-GUID: yEh2vGw2enzQW65_jAhqXcWOdg7DR43v
X-Proofpoint-GUID: yEh2vGw2enzQW65_jAhqXcWOdg7DR43v
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5ed779 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=tyF6uOqd4XZh2prJWCsA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfX/O7//a7p9KWZ
 8NiXvfl/K0UVPC0HEFo3wjNXLou1jvMcm2kGzOWnJ+rBzScu3iutuY3F0ptBb6EFWrqsFuWd4j4
 ifhSDSJQ1CpXwshLKRxBaFW2X9IgGxs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210020

This series addresses a set of independent code-quality issues found 
during review of the Qualcomm iris video driver.

No functional changes are intended.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v4:
- Updated commit description for "Remove duplicate HFI_PROP_OPB_ENABLE entry" patch (Sashiko AI)
- Link to v3: https://lore.kernel.org/all/20260531-iris-code-improvement-v3-0-4c699c3dd719@oss.qualcomm.com

Changes in v3:
- Rebased and resolved merge conflicts (Bryan)
- Link to v2: https://lore.kernel.org/r/20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com 

Changes in v2:
- Updated variables names for iris_get_int_buf_tbl helper (Bryan)
- Removed un-necessary fixes tags (Bryan, Konrad)
- Addressed other comments (Bryan, Konrad)
- Link to v1: https://lore.kernel.org/r/20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com

To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Bryan O'Donoghue <bod@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hans Verkuil <hverkuil@kernel.org>
To: Stefan Schmidt <stefan.schmidt@linaro.org>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
Dikshita Agarwal (7):
      media: qcom: iris: Centralize internal buffer table selection
      media: qcom: iris: fix state-change debug log printing stale value
      media: qcom: iris: Fix bitmask test in iris_allow_cmd()
      media: qcom: iris: Remove dead assignment in iris_hfi_gen2_set_tier()
      media: qcom: iris: Remove duplicate HFI_PROP_OPB_ENABLE entry
      media: qcom: iris: Add missing break in iris_hfi_gen2_session_set_codec()
      media: qcom: iris: Make iris_destroy_internal_buffer() return void

 drivers/media/platform/qcom/iris/iris_buffer.c     | 123 +++++----------------
 drivers/media/platform/qcom/iris/iris_buffer.h     |   2 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |   2 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |   7 +-
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |   4 +-
 drivers/media/platform/qcom/iris/iris_state.c      |   4 +-
 6 files changed, 40 insertions(+), 102 deletions(-)
---
base-commit: b72408a2fd20e8fb7ea462eeb4293f826585fe03
change-id: 20260721-iris-code-improvement-b412d103bd3c

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

