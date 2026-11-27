Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787929;
	b=MuXXMJ1NexpVHHkNvtOm1WUwuryOMKCDfXoWnVUta/UPGVJ+Mz5a3K+TMadr/M5xjKoA
	 rvD4Wglz2rOYEF5KvxdiQGVWf1WZq+/jo0NfHH0GmaxKihOYH7Fzya0LYyeEVMlLW06Bv
	 2dtFdvOLzmzuESG243PuY+XowLq0ljuJIZGFfgmzwQ4yljSNjDd7Ine7sAitostfRSA7m
	 YXuty6qON7gJ0rhLYwWddgePcpobSw0iY7rv2BNlbazmXi/aqMOQTCdiN2LJ8El/93aIO
	 +QcUhXWxR0j9kS8PtwA8SLUsG6a/4ZLOEDp4Sr1RRY2jM5o/iLgTDoBA6IuF2BJ6jqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787929;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cK0hfsO6LY84HqJrabEhSmxltsurGZr9GeMKtUMsBls=;
	b=DRXm4/mXkn665fCnTTx/egFBjOawgklxreRBpyW9IlYFlxnB+nAqAl7O5P/9iAGbn7Wf
	 01aG3q+9EH82P0RINozFbQVmqoNuqYTba4WMLGwiGl75wT+5mkwthoXaS6JcSpy3R0npC
	 s4YVu7b3XY9MnWGUPSPJjtu+N6vA7yEGY72wQnSnLd32Tgrin5/jYKiDJYYHWU0ymft76
	 pU+fCmaksc8VzxJU5y6tGqch+YvmJ+HYSjiC3dVnyGuLhdeR3I5t/6JvdWyl4k5nddYF1
	 nb2fhZMNiFexMORySI0elVI10tXWjL6KWlKdqGuVeeNEZCGojDx0UPJc+dBHxlGqXcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n8ppqP6k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PLqO8wee;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AE7606A33C
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 13:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3AE7606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n8ppqP6k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PLqO8wee
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARDtveK1451710
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 13:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cK0hfsO6LY84HqJrabEhSmxltsurGZr9GeMKtUMsBls=; b=n8ppqP6kYFQ9GmjE
	EbsyxBbCL21dST0etq4DY4NcfHA4a8YCKJJwFEkaYOUHeb/lJEcoeaa0Ezq7K+Gv
	KPaSWVPrkNYsFJX626QQA2idA1UzBdFOI7UFW2YsxMSZZe9ZrYbUnl/RoUHvWFhe
	Wz/hbpbtji/F6oTLrcbYl2sza3wJhBpmeZaWpvE1sbblbO2VEh0MwAcBcJ1+C46y
	rpGRTDGQ2YJc6o0qlNfK8IjD4Eip72RK8HwrANfUryJQ6+7m5l2DDLcKwX98O5hZ
	oR38nCe3ed1UJu7HcOWSQe5u6N3zo7oudvF8ypehOqGj6xPmZdEEzoz1HVNMfWCQ
	LInydQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqm8mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 13:58:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-38355b03cb8so7394167eec.0
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 05:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795787928; x=1796392728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cK0hfsO6LY84HqJrabEhSmxltsurGZr9GeMKtUMsBls=;
        b=PLqO8weefJMSkYog+9sAX0nsymR1CSemcJNUvDeaF6C8G7SPJnh9qhe8v/NQke0+Yd
         abFLpCa/59rB++o/5Fn4riZ108JPKlvXVObtJjXniYC0NH4RGc6nhuntzUDbFf8E2smx
         4vtgO/VgweE1/G6UMDBgMeQDbpd7n8+WdKKsBY24yxUhRKU2TxZmY5B/vaCx4sQQQj77
         vUpvi2X7odwY3bjLLnaXX+YxXeEPERCeh+reaR7QdC27+MD3fa6ukVfCTjTgdFHpmmUC
         b0At6I64KYMz4q6YtTJapLPROpumSN3C67paKibSWBSly0j8wu1Hd6im+rXLzKjTwxc+
         JHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787928; x=1796392728;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cK0hfsO6LY84HqJrabEhSmxltsurGZr9GeMKtUMsBls=;
        b=a+nQ8tYrqKedBmrZPS+Dao/JOUam0ms6Dn4qvkzqweVZKnkgsVw9JU906OHP5CpJie
         8QTEng+KEpoXcy582TGJ1M1s+UWid9uTzHJKPoYsCMc4b8seEIHQ9WtgTeaEVcy1sDc2
         5sp6AQwJGyZ3lfFjxD9J6e8+kp0FPd2EbEXtwMzTvhPCvrqVK9q5ETxqHWiViLNs2j7e
         1zgU4wIwkbqqy0XGG1+KRt/bIq1cZF4D41au+Lnz1qi2/YhMk/Ah9j5Y8pWjIwBRsQuu
         9xWSW/I5ErK6KQokEbPkMd7mfGrSrUCjFRyZQ4Gbre4ONXN0FT/n3TeaK7B5rkptB4l5
         8o/g==
X-Forwarded-Encrypted: i=1; AL+hErG4AcHMyFtREWaWXtXswljc70HJe1TUdN2HBN8Ni4stWXVE00GzLKU1ZKYXIyLYYoAR8q0jY4uidN20bA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8bkWsri8Dr50uiBTN0/qJsPMUKEAQMidUy4rzO9CV+wVsYIfWG
	12Qj2zhVUCWzUGJf3GkDAu4/c+RU5IBbKQZorwa+zv1fFg7QDtciQxMPxkrL2Ksv6ftH1XCvB9V
	R9fYTSm78QUVL1lgnYXW4cKjv6Li1o28kxMB4eD0GTlyBc6C4ItPSLAIYtjpFCOxfug==
X-Gm-Gg: AZFdTZccO0UiRSIQxEmqjU2XEX0H475yWPBiHCY2hG2QfPS4nwKQWoeuPbsNdInv06y
	CdmN+9Bad1Ezu6BXQalKYxx4/h88t5MOv5DXsPGIoxBqykziVIYEt+/Fddyid1k9bXWdyBH7BUf
	JQvRICTYVQFwRZra01epJ/0HzHz+5T5qV5vANRymZMEt03EtPFcY2q/ldwzsjPyW1iKQZYwpGcH
	f/i5HnyJcff0FR+hI8ZHtscBnruMINBXPoseyhK9Ae/5QwloNmmox5vH7sTrIFf4SX0+9EldxyE
	7PLmrUtW+EcZ2dMUcPuHAG/5iCPAxJ12j+SxuLOE6WR9LPhwBdHBibnMt3sDe+uYIPT30BpYRUD
	P9Cy9fyp3Fyd1MiZ4PT7vVgJIKMFVuy5VjRzlIC2AF7kcbbeALVl7cdXVqjpjdhYNvIEWlnd80x
	zeqX7BzQ==
X-Received: by 2002:a05:7301:211a:b0:373:5561:8d06 with SMTP id 5a478bee46e88-38570c36e7cmr21793713eec.37.1795787927664;
        Fri, 27 Nov 2026 05:58:47 -0800 (PST)
X-Received: by 2002:a05:7301:211a:b0:373:5561:8d06 with SMTP id 5a478bee46e88-38570c36e7cmr21793695eec.37.1795787927109;
        Fri, 27 Nov 2026 05:58:47 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm69037597eec.16.2026.11.27.05.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:58:46 -0800 (PST)
Message-ID: <127c1c1e-4637-4bfa-a65d-4b820a8cb7ee@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:28:39 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] media: qcom: iris: Fix IRQ disable depth imbalance
 on watchdog interrupt
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
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
        stable@vger.kernel.org
References: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
 <20261120-fix-disable-irq-safely-v3-2-82f9561394cb@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261120-fix-disable-irq-safely-v3-2-82f9561394cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ST8SzYL-I9NIW85LstxKDkGFbaTCBpy5
X-Proofpoint-ORIG-GUID: ST8SzYL-I9NIW85LstxKDkGFbaTCBpy5
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b098c98 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Sp0_ih0bWsTyJVZjBMYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfXzlGQTKSp0Eve
 5Zsv2z2EoW/E3aLnjMA1+ddE7+bKSw3YYiYXVmgubt/C7H8RSm/6qPzwGE01oq0M5dmapL9PSfY
 crKA7ITxGgbXf6tA4PIB++peeHn4I68=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfXw7GP8P+UneEz
 QigupEdNv0U9U9GHkT4QH1HSlmDpjWh71BQMS5HwAYHCk1BIoGkhwn8U02l8HH5e4Utm0ZtSEqN
 WtFO1h/dITdfP/lr9PTQW7KvIaTyPvuvAvDBPjj7p3cKs8dKqcqeyrfLfs+J7nQIaKaV/rm/2Hg
 dpVGPYXQgMuqTI3/X1EydY7l9evt4ShHzqwkcc9/p2b8Uw0dAEXDWHbXCA6SX8R+fpUuHhSmPh5
 4qb4nEna5//KgagtFF0s8ypF7yBRsk8Llxz8lauoCpDObvupNfvUabzoAuxQSSLL5KjcY9stA1q
 xJIvvVWSqdGnjUNgv6UltHMl6n7+KK3gM8LYUb55rCI3nz+GUQAQcv5zXOyDI+VBcSiskUfi/cU
 TeKiaspSnocscFhagfhRdvDzWAH0G7VoQIHlvr2tWer3fQ7gBrO3t6nvA2u7fc987PMfIUREN5y
 d/WCMpTfrxsUOMuV4tQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270055


On 11/20/2026 1:12 PM, Vishnu Reddy wrote:
> The hard IRQ handler disables the IRQ for every interrupt, and the
> threaded handler re-enables it for non-watchdog interrupts. This
> duplicates the masking and unmasking provided by IRQF_ONESHOT.
> 
> If power-off runs after the hard handler disables the IRQ but before
> the threaded handler updates core->intr_status, and the stale status
> indicates a non-watchdog interrupt, power-off disables the IRQ again.
> The watchdog handler does not re-enable the IRQ, so the two disables
> are not balanced by the single enable in power-on.
> 
> Request the IRQ with IRQF_ONESHOT and remove the hard IRQ handler.
> Explicitly disable the IRQ in the threaded handler for watchdog
> interrupts to prevent repeated triggering. Power-off always disables
> the IRQ once, and power-on balances that disable and any additional
> watchdog disable.
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.h       |  2 ++
>   drivers/media/platform/qcom/iris/iris_hfi_common.c | 14 ++++----------
>   drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 -
>   drivers/media/platform/qcom/iris/iris_probe.c      |  5 +++--
>   drivers/media/platform/qcom/iris/iris_vpu_common.c |  7 +++++--
>   5 files changed, 14 insertions(+), 15 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
