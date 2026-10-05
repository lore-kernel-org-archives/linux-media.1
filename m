Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B092C47ECF1
	for <linux-media@vger.kernel.org>; Mon,  5 Oct 2026 13:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791205236; cv=none; b=TSeQn+G3Pgi6zaxUqQx6kdCYVVdCD5Mxu5pgBADLllimlDGcEgbfby6fwA3XBfPNB9fS0ehlEqiUE98qaNewaU4EK+TmnPBgLmOKZ9rd/VEth3kDKTe3TSvlQorTu5m+XZ3IfD+vbUYrxSdFKXWuIQC508Nj7WDlqcP7aOKoWvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791205236; c=relaxed/simple;
	bh=y/DOj5Kxtb7coTB6QB5NVnMWGcNdmwOCmTlT8mckYQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FDSB0nIcUWua+VKi0U1gFcE7EXV3sa/Z0N0ssrQysn4ACaBdJr3t4ib7HpXS9MI/AjOiC5VjLo4JuIT7fr0yJu95MZdFHm2WGACA1UNNRcsqRCJfjXVpTZIoGNiUo1u0MtjW6IkUdHJMzrpV+W9Yw+MJWx8RsmXUyujt5gSiC5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ER1teMVN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UjvDYe6y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ER1teMVN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UjvDYe6y"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFPGE1527667
	for <linux-media@vger.kernel.org>; Mon, 5 Oct 2026 13:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BPfFEOFQnUkSvYmpAmpRp5GRqU+z/sLm9AJz2jCuNpo=; b=ER1teMVN7KwQmU/5
	3Tk/S1h0H6gRZldInKL6PDosLB7EVaf3Vb5pvhUdzRp8bEKPUwWwyPvRdmDsRTuE
	Qb4b8BQBOsQk5jc7gr12BxIyvO4JC362XJ3zYDvUMBDmq2BmC99KA86Fx66b/nSC
	FDklqorkEW0OnTo5B2NT1B7w+zSqoRZmAA17t09Mc5V9hTcigi2R25PhiR1bZ+pU
	G5ImtczX15CykX2lDjftYDjV3yVhM1H1t0WqxGfOM9VCmuW2qaWYRNYQhR7l4fKm
	ERtKbpXh86YtPzYrHfEuss8b0P6mE2/OE9DtUfn/x0wsvBRhmh7hDO13vVLffR2R
	oDdRNQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4a7drdqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 05 Oct 2026 13:00:33 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34d84114044so7784711eec.1
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2026 06:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791205232; x=1791810032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPfFEOFQnUkSvYmpAmpRp5GRqU+z/sLm9AJz2jCuNpo=;
        b=UjvDYe6yZFhlUaHsPWrBx35Y9ZgvVkx5NJxryJta5uXVBeOJkGs5Hfzt1M64BJ+7E9
         FQJWfApn1e+/PtGK+0O0EWsHq3sIjPNL8RteAfXJpDdzci1oXKoGQe0mljhsfz5TGGHk
         4h9/rftXNTL1EqXeDM3A8s4A6SkYwyXSn0P0TGhS4n8qnRy2ZtFgw6FFZFL/VEKdAvOg
         4i2lpc37Q8Mh4vZeQNEUY4vGSb1RWU+k4p3a2HkE1/ArCFz8uu0j8GMngBFFbnzX5MkC
         ToCWLyDp11j/lX4JI98MzXZ/VZAVAt5bn1wEgc6PTXWhoGj2/CJk7lUYvkuGqFVKF33d
         1peg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791205232; x=1791810032;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPfFEOFQnUkSvYmpAmpRp5GRqU+z/sLm9AJz2jCuNpo=;
        b=pYmTWfcTOOjswM2N79syIJrgxh0o/M34n+phgeRe3KlLpUPCDz8mU4JEeXgI6pxvXl
         8tw+sds7Vv+2Colp+0gzwfg/Q19RCNk4+Mc+0+0mHoKwjsbNxuRfZf2OP/cnUDUXV2jQ
         SxrwSoWD7X0greG5oT+W0i12bMFMoEZZ+BopxRfRfPy2SNK2TS5z2NIOzw/0UO3Uikiq
         Yjwsft2+2xEAmMDcyU17ALYgonJF0pTYOCQYpl2ZTRSgtNJ21vHrn8h93uLFSE+LHUwX
         mNAYcAayVxBEmcjXpF1QpCHFf8CRs8Ff8AbsOzfOAJpL55JLzv3hQs6n5ESHN8zgWrB+
         kZ7Q==
X-Gm-Message-State: AFuF++l0jWW9xUG7Y0i/PdpwCaw5ysusG7SwBh3Zb4hZlSDP3P6/9Al1
	oHWozzybEXfF2pIMH6hhL2ICLsnh3s0pmvjPctIKvJ0PBKwpf0fUg5prTpSBlCeuTbCABDyhzI/
	U4fVBHoXuKHm++g/6luB1mGRmiQcks+9scvjhcqbHQwA2NDNoQcbOOn5/SLskbOTMAw==
X-Gm-Gg: AYBFou1hyW+IWkyKzSLUx5GmZb5b1Hq22NbStIeT6xduZI1+3qsdkClbUZcEd+BWzwH
	4XIoLzVVQCvLSre93/+BXm551xoqy4sKId4A4ucK+7y9OfTYpgV3kSLk8GuCEAVbVqA0y1MR68+
	bBImM6WJ9YI2wZqqL7AlRb1cJV4cqo96dgZPoIRg10DE6QUdN42Vv0G97QxZZK72GE58b0Jrf9X
	Rchr4JBVWsMxNntopSGuwdkH7V3dPmoARz+0mhJgUuGQJbqIxnrIDYMnXSrnCiQiUlO5E9mDGrf
	3flCi1aQnRSAusKg9KW4314plO8TtSkGLXW3TdUx02m2CzIZrXZq2c8y5QO0ktnfkJXZF0nUMIC
	1PGw36CKitVNspnSKjwXNhDuV3jpQ0GD5hw==
X-Received: by 2002:a05:7300:24c9:b0:351:2696:bf86 with SMTP id 5a478bee46e88-3512696c138mr6042744eec.14.1791205231931;
        Mon, 05 Oct 2026 06:00:31 -0700 (PDT)
X-Received: by 2002:a05:7300:24c9:b0:351:2696:bf86 with SMTP id 5a478bee46e88-3512696c138mr6042580eec.14.1791205229446;
        Mon, 05 Oct 2026 06:00:29 -0700 (PDT)
Received: from [10.204.101.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351271847fbsm22548670eec.15.2026.10.05.06.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 06:00:29 -0700 (PDT)
Message-ID: <17c38615-1689-4bb4-80be-6aadd3b91d18@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 18:30:24 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: iris: Retain firmware confirmed video_format
 across GOP restarts
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260905-read_video_format_from_firmware-v2-1-21a606cdd288@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260905-read_video_format_from_firmware-v2-1-21a606cdd288@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1MCBTYWx0ZWRfXztdgqEmxO0Ho
 zFBYcDxbAt6zNHy+xr2LXLWG/BpPOEg5q5PKeXG/5nz6d1QLSo5PhnxNhmLv3pnYgBF2mfC4Rcq
 ZFxj4ouLpsw2sCadRul5k4+TAmULDU4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1MCBTYWx0ZWRfX0OELDGLF44zh
 krOLIUEafLe+RpNCR/4E/nWmsh4wDd0Cw9WpASA1M6AP9/BQ37en5jKQrjkfUXtX+SGAxD1hS5Q
 eU/6W4skRjaHS99rBc8bDI6ab33daEzaF9Qmn9CXBg7QcpAanx/VQ8ynZMhLUww2NrSSv+9X63y
 B7zxacwdLWTU6Afnp21sG02g+Z51UAnm9Ppy3EHjZDq0IQOLzzdeXBnYwn/vyTAK4z/JyXRr4Kn
 kC5GWN6/e8bDuyzgEWROprUV6YuVOfILAHWQrhanGMynKP70JTfDxMoJOoII+7/JK9+gASr17wP
 D0pzh5iZ58z6YCPETieMkn3Y0NaZVd7q8pA651E90QlXUDY6jOEJFNiu7Wm3JVbAciBSffN5PAg
 p9a6lKz0C4DLP0ZpuBB9rPwcX6b2/MtdmAjAYnu1bdn1OLHOmLTPVWKMugsUvD+YjiAXRSUVCsv
 JOApqKYNa6qlVOxijDw==
X-Proofpoint-GUID: FjkD1jh6faRNca3_yf3KBqhzqKkXcNwm
X-Authority-Analysis: v=2.4 cv=SvwFe/O0 c=1 sm=1 tr=0 ts=6ac39f71 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=w_nWnu2JXzorbJeL33cA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: FjkD1jh6faRNca3_yf3KBqhzqKkXcNwm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050050


On 9/5/2026 7:27 PM, Vishnu Reddy wrote:
> During speed-based rewind, the client restarts the decoder queues once per
> group of pictures (GOP). This is because playing a GOP-based stream in
> reverse requires decoding each group forward first and then showing its
> frames in reverse order. Each restart makes the driver resend the colour
> info property on the bitstream port, which firmware always treats as a
> sign that the stream's properties may have changed. The driver never
> stored the video_format value that firmware had last confirmed, so it
> resent colour info with a fixed unspecified value instead of the real one,
> and the value firmware received kept differing from what it already had.
> 
> On every restart during rewind, this looked to firmware like a real change
> on the bitstream port, so firmware sent a settings-change notification,
> and the driver treated it as a dynamic resolution change and paused the
> port. The client then removed its buffers and built new ones for a
> resolution that had not actually changed, stalling playback once per GOP.
> 
> Store and send back the same video_format value firmware already confirmed
> so both sides stay in agreement across every restart, avoiding the false
> settings-change notification.
> 
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
> Changes in v2:
> - Updated the commit description (Konrad)
> - Link to v1:https://patch.msgid.link/20260901-read_video_format_from_firmware- 
> v1-1-499edea4d200@oss.qualcomm.com
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_common.h        | 1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c  | 3 ++-
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 2 ++
>   3 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
