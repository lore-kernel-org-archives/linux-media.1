Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A223CC7EC
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 05:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787032457; cv=none; b=qGRX8Q7TIjU0TmwB5S91rOtzQ9nhJYq/hQNrqnQzEqAZPIL+KARFHGSSCPekY7kYql6k/F+SX+pF+pbiaQOKBAGarGkB9bFD/oZ6KT8EZ1EqXQTE7hdYhWhu4ROtecJX5KrDhUch7hCc/C1x88zoBLUR4bguzGAJDrReCfWI+68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787032457; c=relaxed/simple;
	bh=GosCLyy1/VLuOxPlTGn0Ls10HQdPNBqTDEuKCEOC9lI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UoN1TcpGIgMDj3TA8MpMVIZ//mhAcMkFaY5bxohgIa/h43QrBKG0nce1mdfygCzqL7T1mtIBmW71INJLCzHh/Zel69/ki61qFsUX1jn9FOCEpkkCp+kfQbkZoY8xEaX+qsEuKYrx933N5nVDwZA6gbA0wKdPM9Tb+dRwli+CTf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nrbmFUAA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=btr4bPQT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nrbmFUAA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="btr4bPQT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I2YPnr3761843
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 05:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TbCaoRP4jgmLhzxgTcurQvCQNdUxxOfgWCAkLYtazKo=; b=nrbmFUAASt8pesrB
	u6WXz3wMqamtjyeAym9VEQ30v6hrhOpqNHLRXUYW1z69xos7AnS5/aaIr4VCSczG
	2hUyBz7eu41USoVjZRxHSV1xEdUrpHXsUMerp0kOsHW3MKOd8F7PuiLIRmdfdFMF
	tEzdmZDbZOx/GPAPsRbBnqRa+7Ju90vC2pfkQfnj76wXlM+/ZF4vXSCDIcFsbfVu
	ruQQdsAJ8IFCQ5EA450ikk6EUspdIKiobXhzSvQCBGFerd0bZfdwoHz4Hb6k+3mK
	2JmbjRf6C8qC9vAorkSv/A42ODwkMaZRZWjXqkTjUwHinLZysyNdsyl0lxFjjXSi
	MwL3vQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4eqtrrdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 05:54:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc12e8e22b7so5196243a12.0
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 22:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787032454; x=1787637254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TbCaoRP4jgmLhzxgTcurQvCQNdUxxOfgWCAkLYtazKo=;
        b=btr4bPQTW7WbWGuVR+uOoJLisz1ii7/DxIOSeHNWtvPVUAp57ce717PTTnvDn5nBUn
         yXdmEe0aaSo5l4VTuHqT2rDLlAa7kh6iHKk+ZpsJiiM2iCAEc6VYIj+7UDClJjm798QC
         NzR5jaaFqTkYP4X1VDHWQpyEz1ygLr4Utp+6Kui1CuU9QkJx+1cQPM1dh9S41L+t6UwI
         hAtH/jwRMAERtKIb/LCV0yQ7tQ2pHbHgtmiSm6L8jkGVyfLy1vOvoBSd00kfE/xqiy8B
         zxphmQzYC4DkLFtxuzKqp55lydUybkLJF2soGjuQ1YXAQ4nX6qTn6caw6HXRQNeDSIY/
         gltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787032454; x=1787637254;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TbCaoRP4jgmLhzxgTcurQvCQNdUxxOfgWCAkLYtazKo=;
        b=HDZ8YkXxrfVWOipBvDUB36gtA2OwfB8HOqxsSj4aqnbv2M1H9DBLtEqJaOg6YbqasB
         nziZVJhN3i/nXyD8i07g4svhmHhxJ9L94pYZQJRGz3Ho2FhUX2rnHJFPuwEeVyStFrGN
         puVJg0z+PZMW8DRY9dxoINM+H2R4CD6mfcPQs2PUqXOShWvFMisJHPefifW1UHDDq5zN
         Acx/VIl0LqB798H+ATUTxmJejWV6ZKadANUe6sCjHOdwOcdY+fnNeYoYIOHoOjfL00xv
         e4+o83OOn+PFZojPmIhE2KA5FJ31TK6Mi8eAfIWFeSltQiXx/ZjmBLqY+RLYb5xnJDf+
         udTg==
X-Forwarded-Encrypted: i=1; AHgh+RpIkF7Zex8h77vrL/5cNi+YIpxclTQHPAgYIpiE4cmXNFns+oulrxXA6BF3hyl8bqsxVyjdPez+Avm1TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaUgkgWSEUhV4S2wiJWsNdkWQ3xTPHUcWW3YcJObQsWXiZnbWK
	1quyYczTdWs9YwRUSymD3Pr4swRBF10/hfB9wnc+Pnx/5PRwOG1BA06NiwG6/eq4VIcy7ISEv5D
	7xsNQlhwnidDglfQm/la9Lz8aDQMEqKLuwurHDhQLLIr1qHLCsz/tdabJf8QXKD59cQ==
X-Gm-Gg: AR+sD127kqu0AJgReNZEcxtN862IN7FX5cDzoU92KB/99Njj4q5Hughd/5gYudMw1Pq
	IeCXd+pdU7/wpZb3nWYd0Fu/7MadmaZFf6fIA4E/uIWI8NrlE1MkxRyP5w7uZTccKeI0P6za1St
	wxwiRSDCwi7RuZcJoXLLwhq1nTC9BKFaXrrs32kvbtlFwfELc4m7Orkru6JEjK3w+BZLR6eMCOd
	67He9JtwbNAOhgHi0hlMnB6OXlXAnuWbwEskc4EKw6vhTBsimRkt7UwK9Xe9BVq2dIza24qoD1h
	1DYYEdoQpg1p0XNcAavJbnTLun8Ef/vtF2Djik4aq/NssnG7wKf+WqvhpBO2Y1mVSLeehw+hiZK
	9oSiO3O8r65VKqMbw5/2/dpJpS7rz1A==
X-Received: by 2002:a05:6300:141:b0:3c8:e10b:7a9b with SMTP id adf61e73a8af0-3cc71b19c7emr37663906637.16.1787032453943;
        Mon, 17 Aug 2026 22:54:13 -0700 (PDT)
X-Received: by 2002:a05:6300:141:b0:3c8:e10b:7a9b with SMTP id adf61e73a8af0-3cc71b19c7emr37663839637.16.1787032453547;
        Mon, 17 Aug 2026 22:54:13 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc13bf26a0esm1592712a12.8.2026.08.17.22.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 22:54:13 -0700 (PDT)
Message-ID: <376e0fa0-c863-45ae-a8f8-6d4b74ef0b8b@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:24:03 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET
 IOCTLs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-10-69a02e9090d4@oss.qualcomm.com>
 <tjfcsz62is33iphcwtensnoiohhpfk2zh43qfe7ijd4b2324pk@v3piffq646ac>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <tjfcsz62is33iphcwtensnoiohhpfk2zh43qfe7ijd4b2324pk@v3piffq646ac>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA0MiBTYWx0ZWRfX1SvJYSVaCSAo
 nWimAHGezW4CDAgrUMZA2tVMVrkrSno8jpByJZItRGiILu0ZDx7hA35bCmeyrSwsvZtfIphN00S
 gujxR/eT3gYM3dV3sz+ZHW+M5XRYoAk=
X-Proofpoint-ORIG-GUID: wPOT_2OOf97MI41kMH3zYT-6TdW-ZR83
X-Authority-Analysis: v=2.4 cv=UfFhjqSN c=1 sm=1 tr=0 ts=6a83f386 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=cA8Zc-eO91vsJqbwH70A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: wPOT_2OOf97MI41kMH3zYT-6TdW-ZR83
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA0MiBTYWx0ZWRfX52F8PoaFUBGk
 SMVcpFRSzb/fCtRsMfcbaIjGoCulD7uLAVGRB9QLNYdF/qdiQSsLKIDEg8JY0Mh//aHVAecmh79
 8Sm4vvf02RfUGnINVXXzHibQs5vTZbq4Ocwagv48MqoBC29aIkHYCIcKWkC4BMoa2WH4dRNgDz0
 OZFCmRaQFKeOsNjVzEtjvujYLFPPkQbIwz5nw3Zc+14eYl1kuA8BO1Qmfl+dQwKMnwqE+d4fcEq
 Ns6eaQ+oRbz+WkhAJO7fupITX3yHayv+ad7HoKTEQ5fpRmPfmpSFdiq5Q0BpaniTeqJPP2j8HFE
 3xQMfD2GkRlMx6Qnxj8Bb8l2q6bJgqcjK/VhtRvlc7LxJ/Kpd32Q2R23P2hfUKeN4syaIQaJsJV
 PgFBEwIMcLzYFPg7lsZ8D5NlREIqzqVFpa6oIWJXexbfQaZ9R3xfHndFs208klr1MGVdiFog/wO
 lJE8IbLX3gcPXO9fxew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180042

On 18-08-2026 09:19, Dmitry Baryshkov wrote:
> On Mon, Aug 17, 2026 at 10:17:45AM +0530, Ekansh Gupta wrote:
>> Expose two new DRM IOCTLs that allow user-space to allocate DMA-backed
>> GEM buffer objects and retrieve their mmap offsets.
>>
>> DRM_IOCTL_QDA_GEM_CREATE (drm_qda_gem_create)
>>   Allocates a DMA-coherent GEM buffer of the requested size. The
>>   memory manager assigns an IOMMU context bank to the calling process
>>   on first use and performs the DMA allocation against that bank.
>>   Returns a GEM handle that identifies the buffer for subsequent
>>   operations.
>>
>> DRM_IOCTL_QDA_GEM_MMAP_OFFSET (drm_qda_gem_mmap_offset)
>>   Returns the mmap offset for an existing GEM handle. The offset can
>>   be passed directly to mmap() to map the buffer into user-space.
>>   Imported DMA-BUF objects are rejected by drm_gem_dumb_map_offset().
>>
>> DRIVER_GEM is added to driver_features now that GEM IOCTLs are
>> present.
>>
>> Assisted-by: Claude:claude-sonnet-5
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/qda_drv.c   |  4 +++-
>>  drivers/accel/qda/qda_ioctl.c | 50 +++++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_ioctl.h |  2 ++
>>  include/uapi/drm/qda_accel.h  | 36 +++++++++++++++++++++++++++++++
>>  4 files changed, 91 insertions(+), 1 deletion(-)
>>
> 
> The patch LGTM. THe commit messages needs a rewrite
will fix to commit message, thanks.>

