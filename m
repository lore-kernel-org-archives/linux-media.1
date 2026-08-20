Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DDE353A77
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 04:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787200264; cv=none; b=VgBAHHfvDKuUumBL6EXBiPdZbw4ewfTPAMBVFFSsNPZZTVwZQBT3nApD032S1uOpax217EnpAxEG35b86NN3lE5Zr1X7LHZKisfGGyWObFYxtU/j2kVs/mcC8EWJCioGzU7jfU8+er0HQW18poPNVN/H5m3eVSLgv+9feHtBv2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787200264; c=relaxed/simple;
	bh=ESbYeTT6UZoLxLRl60FYCX5yiloJI3i2RgClfxdS7DY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=khQClelAVmRXRfJYUEoRMNvVA6JdaCr14gcS6y/bvUJYvVeDz4uW9IUP2Onr9+Sbj8UiEgtqiREzAORxTizSTlHvTtQoXf7zyPgYula44+hT+ZjJrcUGmxKq4BLV9vNacp7DnD0JgelI4RqSCsByRdXgzqkiHPf5XsSPa3b3g7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n2k9h9lD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LR64wqad; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n2k9h9lD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LR64wqad"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JL83081258524
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 04:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	frKQRZUt2a/hKuf4txBejBfHQwTIXAlTZS5704pYNeE=; b=n2k9h9lD8Uzm61+4
	sEva0nvpAsRJWrXOdr+J1+P4jqaOEnkCScuaGIqEAXJvb/EEi6FAH9i2yiYnR5Zo
	krcJFAjEDYTyE4YFPNdttSK7THPJ6XvgM4XBtes0CCr7/7bYb8M9PKd5JtMhq9mt
	zRyxa7CODZTBpr3aQl00AyNix7kM/tSLDfprx6AIKYuzJv9hG8IvfXmv9Nd6yKEB
	S/8Hf2cJHBeZ92D64OkzYGTYyuBWcwWpN8mclw6xRkNohZq9QThOrtqGCE+saDF9
	QvR+hBr2GDFHjTJKtaOgv15GEXffyaVOnyiB7+m1zpWGWGO9mLqKPlUEGa0YOWIp
	WGmMAw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es631rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 04:31:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cacd6d37edso23919305ad.0
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 21:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787200260; x=1787805060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=frKQRZUt2a/hKuf4txBejBfHQwTIXAlTZS5704pYNeE=;
        b=LR64wqadqCUCjf9nZO5O17tUoet1Bsm6yuRw6Dzf6TkL+MJEiV3WJkBVfOLoyuKzol
         g27gusStOcq9+CvHj0bmtnx1DC4s2gXCnR8V9J6qOWM1RMorE61rYFbhlgr4Nm6/QMMV
         fw4HxhQUdJGtRaIHOfmJZt3T/FWbYexLdtZShJIeAUW+AEYp71RA5b8akRY6LJ/i1ZBA
         IJokymyX0dnA8e8rWGyUXIyw3PYuLHHUbP19eRI9IZR/HSMGRNbKazrCI+Kn/EV4rI0/
         oL78jbfcuZvRKi/hA34vo5aZ+7AhukJEbu/OZMT/ujr0QWJiP4CNDtx+wvJ739HKoouq
         mtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787200260; x=1787805060;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=frKQRZUt2a/hKuf4txBejBfHQwTIXAlTZS5704pYNeE=;
        b=MOmiruDsnhZQS7yNTYo5fXz1eT5ae+Yd7XRvkgy4PCX1Jvqvfk0/hN0anTZecCfFtT
         u/NHqCMuaStxOYwniCVc7IuwLCdrCrTFQwaQXewXSjeCgF5P3Mncjd9lK3cI//xlF1AO
         fKgTlTBGFS25sm1YCG5OcGN2oIYC8rGEdKciGyxqqrTAWDk6MhyCh3P0zEsxKZEPGmjR
         EHijrO1lDDzKrBWlHbWt7j3uEP1KcqDRmc8NjpDLB99Hmo/RUG4lvcNk/JxU4FuKsUKJ
         LMuscWJiM9xZdrQNM6mi+G/QS5x9ja8Ee6OQzl9Fdw3R2Cs5oAyIORUok3pj09V/sLCx
         0v5w==
X-Forwarded-Encrypted: i=1; AHgh+RqAtHcv8CCfQaFE/PM7L2X2kri28KAPsjohgBVA/IOOV6W3asq4Y5xF+e5hp+MySn1bJt5pxEU8Xo8DDQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mVBn123FALyA6ZyGQrWzog3qFGG0WXdCcB0EiYk+5xfhijC+eV
	Ej98MGLHauOZnRn5cQbTJjwdKHH16IVEb7Cafq1NHu6ez+IpIuKqnGV6KCLTMB+lzaJ+TceQXmq
	haOQRWNEqob9Hol8kcaJ1KVkv0352861ODAaoTSrEm6wTS66Cd7kBkx+12v2n6l1kTA==
X-Gm-Gg: AR+sD10TqWzGrGteM/8lv395993jpiE0sZ0jHvaV7+6wDQ2A3dMr7g8bDS2rSfd3c00
	LiBl+yJvJhhRjjTQhblEsktwqywE6I0fu9H+WJUWz7uGyBZOQTG7Cx+wS2burZ9sljUdP3wAvUs
	HkNT4ghQX1ntksY6nKcVSWPcuNzmwkoSQqg1dt2zyPXKDfefIOebidWm/Y58B3hf9uNnCVQVCfa
	588qRKeV0rEXrGjdREcF+XCeVLblZBUyKq5SsnC6wBqbDpY9MBeMEruO54CsdtnIIUgP19yK+oL
	TigcoGQdMTVYs323CVOW1T4yTOAX3MMt43GNr1OqjLCytilnMeTHOSFbkbsl5zuMyhBTW0r1/Yr
	p9Vuiv/SyexgmS243n3/lGq3vMKMECg==
X-Received: by 2002:a17:902:fd8f:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d5fd5cee10mr198915415ad.4.1787200259824;
        Wed, 19 Aug 2026 21:30:59 -0700 (PDT)
X-Received: by 2002:a17:902:fd8f:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d5fd5cee10mr198914735ad.4.1787200259383;
        Wed, 19 Aug 2026 21:30:59 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d58a897sm1806855ad.27.2026.08.19.21.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 21:30:58 -0700 (PDT)
Message-ID: <7e025cc8-bdd8-4247-923d-821089a8457c@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 10:00:51 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] misc: fastrpc: avoid duplicate DMA mappings in
 fastrpc_create_maps()
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Ling Xu <quic_lxu5@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, quic_chennak@quicinc.com,
        stable@kernel.org
References: <20260805060940.41414-1-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260805060940.41414-1-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E5/9Y6dl c=1 sm=1 tr=0 ts=6a868304 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CeeczvWzjZu7FbgsozkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ivQkFE6nWlDtrgYJv4C6OltLm7AzXrFu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDAyOSBTYWx0ZWRfXzVJPCAw1XJdk
 ftkDhEZRYzTvyQ9py7FR+UrnrHfekwYL910JbgFhTKaSoU9hwKPABiqVh4E+i9TQX62H0FPeEKN
 lRvZMLNOgwWICc9UzUi7zYxI6C9c7meIqyIIRbfkq87LeVYFFHqXCc6lcG8nZ5rJi/cJBy7tqch
 PHdqvkQ5ykUo3NSKVFjUekxZpK/vKYxHt3ssUkWIN6eKf31AmSDaTL6RB+s7v6j66F3v/kLCubf
 uDiuWa0eVuv5oPeTYkeF02KA9QIxuJk1pryxQgEjf2WHU4O4IeguORlhNuJKWTVHkz/bNZpKtmB
 Nz1E7Tzm1Q9f/unPzPDVU/i87gPNdQouesegY8Wvi6fTOVBNEXrxjYrp+WleHMyOKb6cluLS60B
 XtC+KKA/kneUYN6dzPHFJ8lIrHvVDcVXyxnjfJybbKfGemWMTGe4Grj0mkAxTfO8vDonOxe6EZ3
 FtpUR9DGI76al0Pjq9w==
X-Proofpoint-ORIG-GUID: ivQkFE6nWlDtrgYJv4C6OltLm7AzXrFu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDAyOSBTYWx0ZWRfXwxFZofpGxfMh
 E4o2bNrb6ECCqHCS68EPRBx86BCKuz13v1/cXPhP9xZJ41u+aLVbrdLvSxd9TG6i+pPdMnnag1T
 8bRiOMTFofoQUSpylIOXuToKVxKeNnk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200029

On 05-08-2026 11:39, Jianping Li wrote:
> DMA handles passed as invoke arguments (scalars beyond nbufs) may refer
> to the same dma_buf fd as an input/output buffer argument. Taking an
> extra reference for such DMA handle maps leads to duplicate mappings and
> an unbalanced reference count, since DMA handle maps are released
> separately when the DSP returns the fd through the fdlist.
> 
> Fix this by not taking an extra reference for DMA handle arguments
> (take_ref = false) and tagging them with FASTRPC_MAP_DMA_HANDLE. As
> these maps are borrowed references, fastrpc_get_args() re-validates the
> map via fastrpc_map_lookup() before dereferencing it, so it is not used
> after being freed. fastrpc_put_args() only releases maps flagged as
> FASTRPC_MAP_DMA_HANDLE and clears the flag to guarantee the map is freed
> exactly once.
> 
> Also reject FASTRPC_MAP_DMA_HANDLE in fastrpc_req_mem_map(), since such
> handles are already mapped implicitly during the remote invoke call and
> must not be mapped again through the explicit MEM_MAP path.
> 
> Fixes: 10df039834f84 ("misc: fastrpc: Skip reference for DMA handles")
> Cc: stable@kernel.org
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
