Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614158;
	b=ansqwHShdy+DrhJNjF8LG1pxffg5w+oXJso2Mhcx9mX4ZvY5YVCozMmCm9de3vhP3Ywr
	 JmjwTsnZVEwByV2dXiqRBr1Vz90FnxvUN1FDQJTwDtpcuMI0/sMkfDIlD/KKF3CliCLeZ
	 K2GYQ1D9FRuS3BfcfWig4wejs26bqb1boAA+CC0FBQo/nk5xLe/GJvTolkdFYJ3A+Kp3p
	 XENKjx8S+/NZoL6abQ5XSXpPTTAPhxJsP4THUf/As8i47/QW4yPKJGMKjTJUTQ5zelqt4
	 IArVr8UakPFRwrFoKMsYT/UwWYMt9AwbLKbyqDsNVW3kS4QbhyqvvZqbT/189SY9Jgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614158;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xm99b92EcvQYiFo2BERFkDMWH8ztgzfeHS78pLE5VUs=;
	b=MpPfNhrHZVsC9IhgjdwwMyeg8hQP1C8AaPzz/itxcz+FWTtKaIA1JsiGcMELHd6q1MX1
	 sQG3MFbd/GRoRkyM9j6d8iBl2L8YNSQ9/cdKe7AcdxYf1NfWXJRfedXdcL29R9AKW5SoF
	 mxh1eTWX6dfseYv16qAPBfzv+eMVzBFDx4lWhIeCY5r4MHNHeRWIdCioizxjhIqhBNdnX
	 oRQvxJq5hClIpsd6pNVH5r8Ek1uXOBYL4Bvcj2NG11OuFzcW1cN9aXBqgUA0fz1EuPwkT
	 G6l1nZ6TuBFwfLU9mPtVdU66BFulPEcKaXOat02V9lu/xUAFa9XALOu8BOZMNbaL/Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Fcooxj1/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="B/ET3ETE";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4FC606A334
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F4FC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fcooxj1/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B/ET3ETE
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A6ak214014
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 10:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xm99b92EcvQYiFo2BERFkDMWH8ztgzfeHS78pLE5VUs=; b=Fcooxj1/EnfnyTwT
	//vHKn83TDfpot7hVAY+bwYIcrYfAleant7bpT89zR1ne1GFlGdUmcQ1dE8WxGtT
	yzF+QX72fTvEX03D3r5nPmYKKOMLldpeuaD+NM6VM4G4VtMNQr5Ie5ZM/99IWOH+
	7WFnVcfA3cyDMmYaSHAMrpoGOHvzgoLxMCPFzRI+4VRJJ6FWqYVbS+K5q5iMLLWt
	irMjg9i5uOI80dz94zuM5alzkZfHUHBh2kCdG/G64IUiDN9v26DDI42eFU2j+l1V
	+sGC6c9/0ZEyDIFBsPgdz+wqferiq6K7sJ1W4NPtLQJDg3I0Q+OTwybI34zbJgRX
	4HGtIA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1s2d3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 10:09:17 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7d2ff0087so1740995a12.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 02:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793614157; x=1794218957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xm99b92EcvQYiFo2BERFkDMWH8ztgzfeHS78pLE5VUs=;
        b=B/ET3ETECOR0wBEVagOfCHEWeRslA+pCJh0zIb5EZqOyIgbPPfbubwZYnvQWeeGvZb
         E2z/0iJxePm0GkejM8JArpK04YGOW4ky2fHO/VJ4aWQM38fNdlVXwmGyB0By4GbXIo6y
         08CL/ibRTLltTWBvqhr8JyBH5dkRhqTX/rfV8QGZjVSl0lPsGEQEukH1fPTfJ0hkXoPk
         CILmjq2sdwx9wpbbXzWj3c7VtlFJihIo0ZK+BJNVwY+405Eah8F3T7z4MtVjYNW8OSwM
         1kfGKtfVSMj6PNY1vaBd6LbfhbMkpkelO02bGgqt3n8wAoE2vlKWtdXm1lBOsun/TBIF
         M6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614157; x=1794218957;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xm99b92EcvQYiFo2BERFkDMWH8ztgzfeHS78pLE5VUs=;
        b=ItLrDgViEZFjQgvbZc1vC84Es2RDXCMI0+vKDIrqCGIv777L+fYdxNd20KUZaFg9lV
         ZAFSv+6y5mFprtvBp7wF7ralf13ch/5NKwU5nUUzkjt12VLSccldvDY1NTpprmep9XGN
         kCh+gx48/RqSY6H8d5uQdBneDGmNxhYCTJzuWbot5nhEX5FtkF89sXd3vxwI76hg5FJj
         72yfybJc9SwTW6qfRn3ULGSy4ryuGhO1ND4DG9etGkG+aGIus57/yUWaptq4qOVpVYUa
         Ud5hGI5tAlgf2AaJeCB7AstFQvJlA0kPWNIiXRZuU9O5tHO6/X9QgbgELJAIsrvkTf47
         jLqQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2jjR/lT+Prqqr2c9hraRreOpxdKPGt+1cC3c7l8Er1+i882SbbcHMr9wp/upXQHrMqCFU8cCSk3OCyg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+QNAFmH3Uup/0NZxlOBbV3+0QkE+uSzf+XAknd2GdMkVP3yWvd
	RiTVjvVtw7Iht/vHEpW1thpwRnZqjI7+Z224YzuiF1Q73NPFuHVBWOCJ0zKBBODQ7uyaF0nJhGH
	SKso9sLx0LHBpBpE4j6wsKUhvopAj+JoKXBNhw1Z3mvo8kmHvX6C8LBYaj6mEFRQoow==
X-Gm-Gg: AYBFou3EUlelLwRNLRNyIXeZw4Um3P9E2pS88ifduS98Rzh3PwhRg6272k2adrrsW0j
	tSGP8dJD/ylC0xgAqqA9p+nv9nQTB+/V9AzveuHiwnDAGTTtVmhj/6G8RRclHZlOhcxoa+aUVnW
	ElhkdSOCabV2srxUaN7uqG3sWiGvO50ip1EGla5ea5O+pZ4Z/ptHI2mH/81OdgzPjqMRV2oq2bJ
	qYfJ2nPo4Qm/e1VHL1m7d9exhC1A+pQNzvBAufBpitkD851rird4n8GkX75hAFgsR4g/+RI+lJT
	STh9+d9STSkUkpzaa8N//+3SPCyt90rijGRKLr7rXQ96DgT0uFZdm3ASF4sLN4lGq8dy68CcnEE
	2daqzPjoQK4au9MbgPqvRACTL6A6mvtvhkbwpnQs5pySr7RGnJF/mWtHqtHC1QVqLHa0WbYjL6l
	a43Q==
X-Received: by 2002:a17:90b:4b8a:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3ae8977737emr7207323a91.40.1793614157066;
        Mon, 02 Nov 2026 02:09:17 -0800 (PST)
X-Received: by 2002:a17:90b:4b8a:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3ae8977737emr7207161a91.40.1793614151969;
        Mon, 02 Nov 2026 02:09:11 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e98f888sm18169303a91.13.2026.11.02.02.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:09:10 -0800 (PST)
Message-ID: <26ca5c66-a2ff-4aaf-9c9d-724ac66480eb@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:38:58 +0530
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
Subject: Re: [PATCH v4 00/25] accel/qda: Qualcomm DSP Accelerator driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Srinivas Kandagatla
 <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, rob.clark@oss.qualcomm.com, jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
 <a97fb0b0-e4e1-4b25-a5ac-60777941c574@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <a97fb0b0-e4e1-4b25-a5ac-60777941c574@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: seLfsqMRQIwOPwpb5mDvytuAqELqg3Tj
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae8614d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=PkZpfZOK-p4hLHj_r-EA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MCBTYWx0ZWRfXzHh26luoIDz+
 j9/YDQtAk8zl+YxCXiAtj2olYbQ0x7Ll/D9iAB/DGW5XXq+hJqsbCX3XnDJHU6FmlMxHTu3e+IF
 z0QhUiW8oI+vok6Pfz9IvqzPCJZ7F2VR7BpKXNNwQg9bKfhLDypDrpGEpPhkqHCbhHiYoKVoet9
 y5fWGb+6ih3LXZhylNMw7/ZqzW2Pf2MBKAHevTK1qibKR+M/FiaHAGtjf6IDTUiqbE3tfpiysZv
 A3SLWfZhEoAX3O1EgiT7RJsR5A2TFIL/N7ov6Bc9z8EI3C6aZi1wi5v4T2taql4OzFniIisA7y2
 tqRao6SvcYpvrrbEWAXqqqUtnrrMkp0m3nJZnnd2bmLPlv7k/v1hnIqkeBnaU+ID/nuitk83caO
 jC8jucbUCpDqRD+I1O1K5u38nnag8HLdNZFJz0hH50gFiABAY+5gEUkvfXtgf3MWe9JqtpZxJxj
 8NAYPPL62zwg5v+kLDw==
X-Proofpoint-GUID: seLfsqMRQIwOPwpb5mDvytuAqELqg3Tj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MCBTYWx0ZWRfX2G354vtfkcXO
 JsnXxGi8wztbVSH2dRPns1eRMmhSRzufpzw/emki+2QO/8Yeqf6xZ/lSqqDVE08SG/eMOtvgInM
 ciBfWGL7/hRqh32LfjrA+0LDFJMr/Sg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020040

On 02-11-2026 14:23, Krzysztof Kozlowski wrote:
> On 01/11/2026 23:21, Ekansh Gupta wrote:
>>  drivers/accel/qda/qda_soc.c            |   66 ++
>>  drivers/accel/qda/qda_soc.h            |   61 ++
>>  drivers/misc/Kconfig                   |    1 +
>>  include/uapi/drm/qda_accel.h           |  282 +++++++
>>  33 files changed, 5877 insertions(+), 1 deletion(-)
>> ---
>> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
>> change-id: 20261102-v4-e8feb321263f
> 
> What is happening here? How are we supposed to work with this?
> 
> v1: 20260223-qda-firstpost-4ab05249e2cc
> v2: 20260519-qda-series-78c2bf0ed78b
> v2 again: 20260817-qda-v2-78e2d1f10529
> 
> And now completely different one?
> 
> This makes the change id completely unusable. b4 diff obviously does not
> work. Any tracking of this does not work.
> 
> NAK, really, I already complained internally months ago about such
> practice, so apparently not enough.
> 
> Best regards,
> Krzysztof

Sorry about this. I lost the original b4 branch and re-enrolled the
series for v4, which generated a new change-id. I should have carried
the existing one over.

I have restored the v3 change-id (20260817-qda-v2-78e2d1f10529) on the
branch, and it will stay fixed for all future revisions of this series.
v5 will use it.

Note that v4 is a substantial rework of v3 (the custom bus and iommu
patches are gone, the legacy shim is new and the series is reordered),
so a range-diff against v3 would be of limited use; the "Changes in v4"
section in the cover letter lists what changed and why.

//Ekansh
