Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787066;
	b=tPz1qlzvDLUlrH7sKvgZ4wcvFM+qkYhuZyXdIqnJCngtnZgbNmg/CBn+HB8VuoQlaWzA
	 43n+CJWnHsbyTXN9lsCNWNx1WY15q2H/wje0vR1RyVubXIRa21pa9QkOkvX/dow8pbh3M
	 Y2d3y3vMIKwusa8x6mwkkb5L5oh/R6B9UZRI7KTx2sk8XYJj3al7Tw/yFY+URgGOsWTym
	 EoXJvcVLUFAI8fnWqA/hV0+Iu1Tktj24UkxgpGgXLX80E+a9C/ZS0ufBNEI9GPqHUjmoO
	 NMYoRVBBmI+nulSOKrNkbxubSHK07KecPwvRy/ytXWyhplv1s711EeLOX1NrEh3yoWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787066;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zYTrvOWjXbG+OFIqWLhv9qk8rvJ+yr4cMCVB2CA2gLA=;
	b=PGLIeg60scgIg414df0BcARy2Sa8IU9g9r8wCEwTmrZPYoIZaRxa3lbp46LNgMgmCaIv
	 LVEZCAeGlV6EQ07eEKCMLPHovFJtHNPuunf4DqjoOkQmxUHvre4Qg+lzVDhUSfg5DHMcW
	 oEHUs4BeWMnG+wfthSKylNR7IRj7AZweuwufI1QXmqTBfrSUH8lH+nvguDKn/3Z5uRW9y
	 B1WyY0R9e1CSEl6FIH9wpElnzw8SD0gHmTgAbo5VvdRKELh6IRu1XP1t08hcb6dhYPOXE
	 osi3kzxwbHBaSYZVyVyRhwyLIH19ZGv05TDAGQRBZzisDxDF8gkQI1VN9ztCqfPMFdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GSJIpg2H;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JV5oGwct;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE77A606A31E
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 13:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE77A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GSJIpg2H;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JV5oGwct
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARChBZd296402
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 13:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zYTrvOWjXbG+OFIqWLhv9qk8rvJ+yr4cMCVB2CA2gLA=; b=GSJIpg2HkmbXyR5d
	gXUVpvYlb/zZtVJ7dApCh/h20h5y6eGTepYFjdVYoCR9j5I6WqeUVNdo36v+AoWR
	NNz10/mbAlpD1xd0NmM8Mb8JfefU32GBlavkc5rf+CtgRFO7wwbtGrH4fzDKTYFW
	J0pZt0xjrAnuQc6zLAPyHbxCVy+y2KMtNSV+HjLi9hNwiPv6t02uRrnsXaezBAfV
	4lS+pUKtzC0q64KGVPBdh9XNwcPPUISxLxvJ9UBFalb7Neqtbyi6r62LHb8PqWDQ
	TPL1zuPd3zV/TXXHLEeZy1uuHfIsyBLlUN7Z/mJ5HkId1n6qrIbVjXEr3OsTCJ2Y
	C5BDBQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6snx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 13:44:24 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b53bfc9534so3554638c88.0
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 05:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795787064; x=1796391864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYTrvOWjXbG+OFIqWLhv9qk8rvJ+yr4cMCVB2CA2gLA=;
        b=JV5oGwctFBeeIrNCTckRAaBXxE2uSbrS6aVx+jTv4wsZNV7Yx70iXD/p3E7i+FVpFe
         mUtMETJt/jxTyjoGYXyP3GgnL+Jm+4zJrZR8VzJ83iZ3S0YcJMUpRd/njeSkodhZRI44
         lqf0OUpfbQoZ3hB7QsaeFf6pBViF2sfgE36Po7x4cba1/CnEQnqwSLJS8LUnt4s0yCKt
         jPUH1qlLCWw3LKAQirGDcAZXbBn+mlgoW+76DzzTlETRA40HcQkEP9rpUrqbcb4RxkGi
         rw8lQMSJaRjkpV6eCIptE7EHYcLIsp33lmk0FBxa/LcFKjLc0z7O77nWD/dMv8PMGxxl
         po+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787064; x=1796391864;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zYTrvOWjXbG+OFIqWLhv9qk8rvJ+yr4cMCVB2CA2gLA=;
        b=BkZ/BByvHUEb/ZGXQvSflVV5GigVps0NSyuC5pvUp8RbAgJXUeErXcUZXoht6WcP59
         CMUGhoeqCC0NQlJEsQxm49Y44Uj79HxQVqTqDCDOSHf4PdYZkoHXA65MASb74Xtah0zp
         ZQKHRK30lk4KVwVlqVQ7ww2wAPN5zZkr4Z5EG8dKTWTaszStXfAuqTu8LSdOl4mi3c6R
         LAOkCzhJbWb9gBKX+WUIhojUKY7DKt7T7kOAYuqRk6Vwzy0iQLFX3N6sT1ho1FChqQfD
         cwATYVQGaeU9OI0Je5+woNW555HmOGYCV0gwv6K7AR1wQ9gwwEeYPTWJhQhwinNb6v3r
         YsHA==
X-Gm-Message-State: APuU4Z9+3JXrpFyfLTzNWUpAyuDi0tE7/oxwPlJs5WzFXUCJUTALhdO3
	Vx7aLOVhcS0on7oG1glOcCklY8JqEmFNW9QyG0PlbJKourk+pS3lM/GqzBWbGieF8g6f7HyUFQZ
	avQZVD1Y/vFPfjlxc5tp7R3o9Rp1J9LnUBm39rgnpDZxIga7qOcixfPP5yfSwloispA==
X-Gm-Gg: AZFdTZf07kFfKm71NGwYXnopX21/0TUFw1zYt44WqrR5iMvBU4fbChznRDYH1NHHnHY
	4CL9KbjpthXK9IpoKodEc7OucLzItniQwr12137Ev9EPWOjhv+fRWOT5UooRh9ckxZD5WiAQtck
	OSOoebXf9jhHhJa+Z0O4+OPdrOAXRiRoTGb+1GiWsmPx2TnUEuBteuqXxLRZNtIcPbN6wdGOZML
	/u06r2m2RtjxWD4WmXHHgSCBP0EwBPDsjptMYDPNiI1wEJkLFCJ0CtyWjV5OVo9hjMXDluJiRge
	mFJ/B7xx51gXIB22OqovPDSGClBP2ILq8GZLcW2thVdn3UxMgns87yViNnnHBVvm2+Nm/q3vGtC
	czy/bgjvnzEV09dXcMATEwi9jf+r7xDIivMU8EVBiB9YVDoFFgWDr0kva4rQY4M07uTAc9u4mrw
	ckDVEu
X-Received: by 2002:a05:7022:7f01:b0:15e:9126:c60f with SMTP id a92af1059eb24-1b5568bb55cmr21345097c88.29.1795787063644;
        Fri, 27 Nov 2026 05:44:23 -0800 (PST)
X-Received: by 2002:a05:7022:7f01:b0:15e:9126:c60f with SMTP id a92af1059eb24-1b5568bb55cmr21345050c88.29.1795787062620;
        Fri, 27 Nov 2026 05:44:22 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm57734614c88.12.2026.11.27.05.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:44:22 -0800 (PST)
Message-ID: <904e456f-6e36-4ffe-8383-0c509c52c59b@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:14:14 +0530
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
Subject: Re: [PATCH v2 4/5] media: iris: Preserve timestamps on error buffers
To: Xilin Wu <sophon@radxa.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, dragon@radxa.com,
        Chris Obbard <chris.obbard@oss.qualcomm.com>,
        Deepak Sikri <sikrid@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Loic Minier <loic.minier@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        sakimidare <ssmzhn@163.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261127-iris-va-fixes-v2-0-385e8636c22d@radxa.com>
 <20261127-iris-va-fixes-v2-4-385e8636c22d@radxa.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261127-iris-va-fixes-v2-4-385e8636c22d@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vpfMTotWsOWMAuVmssvxWyxNnK9c2eZ8
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b098938 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Byx-y9mGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8
 a=WqctcwEyiccVfxc9fK0A:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
 a=cvBusfyB2V15izCimMoJ:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NCBTYWx0ZWRfX0xK3svvD/3wi
 Nr40/FArl33lz6HbIeuMRf5vlWRLtAvAp07Lb1fRT2riZz9IVWUp48r5pIbX0DkRFRlYi0ECGNm
 f6ueHeHTNLoAGc51BKwmREVWZ+n+Z0Y=
X-Proofpoint-GUID: vpfMTotWsOWMAuVmssvxWyxNnK9c2eZ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NCBTYWx0ZWRfX/WQsGPv8mZTN
 wFFHDliQcnoGKrFO7OrO1Rmp67jwHSEr0Eb9bj1k1+luGOJ5PUF9gQ+nDRQtVFr/FD5k4jWKtIU
 2+3lAlerlUgsyE5c79D8kVoZB9dEmc+c6a3D8Es1fzngr2/0utNDq7LKY99vLL1KNc/juCGJxqo
 Fvew8nv67ztqdKrAzuDk9i2ucoHQk6LZpP4/9UwgP2TBy9OU16HA49AYS4iEcxleqZ7//dnEEMq
 cUKAQLN6FY7XoYftkdWOjUWMHBCa9MKHFdjw3o6R8I0UGPlURs+OYNWCtg2nkFkOAtd6xVVNnpm
 kiF2y7McXRXrpTfmp8NrWdSG9+mNa/ZbX6oumTluQbp+v2x1/+t0spQ8iChYYir3jHjz+ZS0Hwj
 yN6dEoK7pnE3v4M/Dx55jLvn56YsHpDR29QSqDEDYvPmx+y3Io4kHyO0fIRUS4mZELb3198ZGY3
 JUD4Jm0K+R7WgXuV/Rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270054


On 11/27/2026 5:10 PM, Xilin Wu wrote:
> Clearing timestamps on error buffers prevents clients such as libva-v4l2
> from identifying the failed picture and can cause synchronization timeouts.
> 
> Preserve the firmware-provided timestamp when returning an error buffer.
> 
> Fixes: b791dcfcba3a ("media: iris: Add handling for corrupt and drop frames")
> Tested-by: sakimidare<ssmzhn@163.com>
> Reviewed-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
> Reviewed-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Xilin Wu<sophon@radxa.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
