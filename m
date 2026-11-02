Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627208;
	b=2nCjlPnqcazz7egHLN1ilVmcqHvglpW4lHAP4fixOUvJHg+wYwRHheJeIJuv6tbxQT+H
	 tzPTpUe8L199kLXrYDp6XYqj76jKi1eixm7guirYVpCgsorce9/ZWZ5s6rpbqAix8Rr9V
	 70PZk81oFNY1hZ93EL3fsdw0zOaWM2VDLYyDWNUB8Sn4MZpnOf/vBmR4GuceqHl4vYAJP
	 nVDC/dT6JjxLB2sPlOp54VvQIyiHbMxrCemrkXJ7TiL3VzoRq1Q4Yff3JDaijU0ERJZ7y
	 O8+0PFtsDiBfJCesupe3SE6Ch/5rJ0LRq3cVHwraGcoGHQVBlqgQXWu28f6IhId9B1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627208;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aFpKkAP8HifgEddckPhCbvrWHiSr5ELXk6ODk37kw/U=;
	b=WXagqRqqFmf6Qq/dyd3UIHkxZsWXW79VlP8QEwhno4r3cddQhfZttoeRJfdpkoWXXlSx
	 dPusH33/csoRiev6Hqs2LR9tLPouekPSUwtHwtCYWaILJyx+MBbFrc/L/Zp7jijIsPEZL
	 C4Gf1dACcpTZr+z97nU8YxYnF/XmTnXy7CT/5IL41M6VmcSM+Rse1EiU781xO90tzc0rY
	 4jlHuPz90h7Ghi8PJNG5wnf74bGV4vI6I3CPd78EVEEbvA1W/m1OLeRop34UVXXD6fnLA
	 qqpVUb8atq0nroPvzzPM7hSkUtfx532MnyGD6ZkWxiC/+X52xto3i8l86Jap3/6VB/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mp1FzEuY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dr1ukPsi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E7E606A32F
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 13:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1E7E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mp1FzEuY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dr1ukPsi
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DANdH388348
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 13:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aFpKkAP8HifgEddckPhCbvrWHiSr5ELXk6ODk37kw/U=; b=mp1FzEuYO9NYzNKW
	bGaSq90IeO+hYww63wccVULfFJq0/q35fXSReIAL3X638YvXUE/DSsX1QSh0tSXQ
	zd2akAJKNOlZNm1ENBE7/1UM3VBBf0iaEjU0brM6092iqFgN0YXg9T2KOzpfb3uD
	14xgQcDTpqO/eJDKAHSR4m8lZ6/+/z/5H1gkbiTJwcK8/Mr/Kb1ozzPwgTKeBn1r
	7oYGuRGbqP/eoj3OHgPb093ylRxwRCtsndg6Tg+ZyzCRn8//m77vFaU7gpKaceOv
	g1fg+IRysQOJDE/zOJehL0xMiaBP5R+ISBv47BnJu/NC42Lvb2W5uJexAGVXWsD2
	6D5Xew==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph19c1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 13:46:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f6f4fe531so487362485a.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 05:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793627206; x=1794232006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aFpKkAP8HifgEddckPhCbvrWHiSr5ELXk6ODk37kw/U=;
        b=dr1ukPsiWTURy9B6+33xzZ78uRThhBVxBBK5uB0/uxfro2mH/AE4mrUs3Mwty1T33A
         6O3gEuMikqt9YNTrhtMeWp3fxNE9384atz4KzEYnl6X272D99zy/pognRu/NJ3k9mnPg
         z1nIUZFaEbLlfM7WApDox2EBo/OrxhoK+zeo2lbcH8OA2D40k6eJqPhhSzszlZC6uh1T
         IfRz2O9BwmXOZrmomNdnyolF0KIdJVvHaK48K4KA7zbUy5Zg4FMUShx24s49WvRMrdbV
         U6r2vcYuUoP/5J+chw/w7sLl718Qz4aOsR+rMXCCj72vUFs3srHhB/2uO8IjUkZ+DJOo
         a6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627206; x=1794232006;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aFpKkAP8HifgEddckPhCbvrWHiSr5ELXk6ODk37kw/U=;
        b=ppS+6wlKOgKBngGc3C6r0P0NqCJmGI0Daji2WEs5SfKKXNIrHvHRf5lVmgqmU+3047
         JvXRnS3Pu/NWtAm88fSbWKNXo7vfvms94BL7xapkYCDWzcJ/Pn2dXkif9vHYjXUF7SPc
         ZkRBLXzsv8sqFmOjTLsV1E2X+AdaBJLNixbuN3lOI7IpZyqTcuGin/MzDDrTiaRlYWkM
         xxq/r8HCmEbf36QyaUIf/Df8yMgXbg3oaCm8a2QmTGWIpe3ZtJTtmMmh5iovk2UPov5K
         Mb7nZ1PApWxjDIqmYSymRxz5KtkXmRDPm9a+2MStn9cLJzd0N9X2IvrofmHeCX5RtrrD
         X9QQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXP3aFZhHA37xIaS88ksA/LslSdKlM9rWwvTaoJ5/djEE5lQjxqNWqfBLbk0Szju9+x9z7KAvkvC+B7Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIJFa+NRiwwhIwE1w0c/UguPea2Dkq7sK0CBjTmxFUFYtWZJqii
	p/wfqPKEC8Bz1cvUohRcZRo9n3jULHeSV1EW95PRGIQ1F8YfBWeSqsVf4ppoOIdJo/5Euom8i1G
	GiIwYMFSog1EaJTtJUujRU2lhmUkHOKYRc+WeUMtP1UQ6MsbyMs3ZUtcPHgBFfciEUA==
X-Gm-Gg: AYBFou3C+ibl2EfDkcinPbpRJymHpCqy8NxsbUCq8qw8qIjs15eNGlx0owR5zJZIXmU
	XGa3/wgKihHRQ/EfW7C8r/NGd6R4cJy3iRORaMkok1CU+kerc4feeMCRO/Nhs2UXv73vyGAUZU/
	4d8EQwYc/e9pixkqPKk1PrTqvTDsJr3gaObik/E+uz+UZtks9qhvs2tDrXzTrbd/AcX1FXUqysR
	0rjtMefolF9ti7AsTP/d+RDFhpcxT2ZYl0bh9PJ/ChLJDdiq0ppv0fTzHIC4LCgtC4wMGY9pz2O
	qYr44u8tWsBdzstco0EPvBetV5NcSc8NgiAUw3yHGkbCEJOahje7dSIMKXd6X/MbUdl9wCSmhoo
	7g76OCNqwgIvSanpcpAbXDj/bvGtQ+ltD2VGXHVlvGbVOnSPlHn27wtp3FZMULUVVJeM=
X-Received: by 2002:a05:620a:19a6:b0:914:afc1:c66d with SMTP id af79cd13be357-94421584b77mr1508273985a.11.1793627205005;
        Mon, 02 Nov 2026 05:46:45 -0800 (PST)
X-Received: by 2002:a05:620a:19a6:b0:914:afc1:c66d with SMTP id af79cd13be357-94421584b77mr1508272085a.11.1793627204688;
        Mon, 02 Nov 2026 05:46:44 -0800 (PST)
Received: from [10.40.99.77] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca21356sm3446581a12.35.2026.11.02.05.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:46:42 -0800 (PST)
Message-ID: <a76dda2c-dff6-47e3-b330-f77365a8fa4f@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:46:41 +0100
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
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: libcamera: pipeline: simple: Disable packed mono for VGA sensors
 on Intel IPU6/IPU7
To: Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alain Cousinie <alain.cousinie@laposte.net>,
        Milan Zamazal <mzamazal@redhat.com>,
        libcamera-devel@lists.libcamera.org,
        =?UTF-8?B?8J+Qpy1tZWRpYQ==?= <linux-media@vger.kernel.org>
References: <c218b8a2-9e69-4ef3-b36c-7df7e7637d4d@laposte.net>
 <3a98bb5e-a4c4-40b7-ad4d-1b251c03b4ff@oss.qualcomm.com>
 <20261101164311.GA3368923@killaraus.ideasonboard.com>
 <auhqOaZmN09mxkqv@valkosipuli.retiisi.eu>
Content-Language: en-US, nl
In-Reply-To: <auhqOaZmN09mxkqv@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zjeGZiGqmgfJFVRNKob_43iYlX8A0nmM
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae89446 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=6yqp5bE4hUTj6ghFmzgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: zjeGZiGqmgfJFVRNKob_43iYlX8A0nmM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX70VHs7Ii9kRS
 FdBJhZ9MBZi5VOxOs7gUC3zk0T+jeItrgAen74E2rbeBr7Gc4fzOERwdjYRaE2Pn0Pe2Vis85gg
 e0n7Vm7LXwsgPlkQB20M4TDfEBm6ovrXZWpOfuErLyEAOJdE9g79MhHL0k7W1ladoscJ7du7DHy
 bEEv5JwqCzVnuf+cYKf6w9phyT7T1rnGE6FzmACEKOFLbVWOQv+nnaC2LYjP2rzO2vVMCw/P2Vf
 +9Q2EOvYl1o6UYXDM5ju1nnk948nIxY6tXCeUjoNlaJX98KbrgoRVRfKscXGo/dAkWIRMtmPHQK
 1JYgrKlY4xiNtzlC0UxrzWHCvYbs272ZnH4kHigrIJx8uDj/pO68+h8SBXWxceOzSBDFgPdJb/q
 ljZANdcufd+bwThFBmJnCuanWHMp9KHcbMWBy/eVl6CTaFBwY1ayOARlOx0ZfxNGhWDFrg9qTim
 LSyiNDiDUP8+AxLrT5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfXz9mOhUniPeV4
 JNFfcHa7iFB/GjrYxEiUW7uauNoMcIIKBHl05WxeAfOn0TGWXVg/8D7J9M5w+TuxwwT6FY9w49y
 yXqPnO0L113OinlUWTnQmAzn/oCZZPc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020054

Hi,

On 2-Nov-26 11:47 AM, Sakari Ailus wrote:
> Hi Hans, Laurent,
> 
> On Sun, Nov 01, 2026 at 06:43:11PM +0200, Laurent Pinchart wrote:
>>> So please modify the ipu6 kernel driver to not report the packed
>>> framebuffer fmt for the MEDIA_BUS_FMT_Y10_1X10 bus fmt.
>>
>> Better, fix the driver to handle the stride correctly and not stall.
> 
> This looks like a driver (or firmware bug) while the stride appears to be
> correct.
> 
> Hans: on which system this has been observed?

Note: not my bug report, I was just replying to the original bug report.

This has been seen by Alain Cousinie on the system/laptop on which they
are working on enabling their IR camera.

Regards,

Hans


