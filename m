Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD9C48551A
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 10:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367442; cv=none; b=EkWlYTDKnvtbc/no8ZofWXgPI95VySiEn4TH8Q66Q4MfJ1zxEPGAEm2p6jf0+g7DiAzBpmVlmwFEDKlS2ap/M+v1E27RAZPWMx+YN5JqgfOmpDQ3M/RJtXTxmjMHYzijl0Wx4+qRUYm05lPn2v1LZjyeQfWv0fksY7uFP0nn67U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367442; c=relaxed/simple;
	bh=4yM7CVQmNDTPX/vEciJLhHIVlge+DSOESvRSzxjhG1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iqia1RJ9RUMTCPh6gbBdyDdg36VO5m4k/INmmasayeq+KJw2l3OkKayG4dYp3pkiVKZaHsZETdlBk+Wicpsgn/JDwY3JYnoWBO4fiFeH9vbC8RZLS6lv9v/E46uxNCrn+qwxBkYP60Ep7eJPXM1PQi8uQhX9snx5u69MtCkgI5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpbru3pe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNX/0C3B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpbru3pe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNX/0C3B"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jhix3298365
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 10:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M03AwNxsc2r/rMzULNXg8D4H62RlVRMbC2QVmKzSq6E=; b=lpbru3pe/3TX0S5f
	Vz4mlcuk2Jr7OEtMleywJD+8IT07fFgr5LQ7hD0dtRonIwvvYtlRBxCN0dZBlfOY
	BrnChFo2mJzeEIA0ikFtcEpykGw/t4pDoQ1GeGA0LZMksYbmwFARVSVb1sz0jMAW
	Cbl/EfxQnj6UCXvaky7dGJiyGkZOyByVkm6wwrLhQGhiiEWKDo28DcjifZLudpQ6
	5rqx6sk3EY13b/EegfDYhUVPKllTBZUWiL3GZSf5zfzyOX+OEltjQmrbwnYSakEj
	jVAF+gwqV0OrFWPdBOiomVY6S0BPzI/qe62PAlYFFRdm0uJkM/53rFiGa28c9oD3
	VOL9bA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcrjkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 10:03:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb71b1443so733171885a.2
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 03:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791367426; x=1791972226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M03AwNxsc2r/rMzULNXg8D4H62RlVRMbC2QVmKzSq6E=;
        b=BNX/0C3BrVXJe2b/PW7Mj5357M8toh8OufEY0u2oOO63JXS6F4z6+4bLiGAgJN2pZ0
         w638Gqh1kVxcHrnB0VXi8yox6ExD10LbxVqcXQOBbMJiypByWnfTeEMuB4OW0EAsridw
         YmUfAVrg2UU8xK3d8b0SDlEZO/RAB5MHmHTLfUlewXNyRQXDlEp/yQn3ssJobeba2VfC
         S3rKlGWQBR/5tybY3ehkBPEoUmI+3UNfC04F+so51GmDV/sf7HFl8tBYSm+VZYFoBmL6
         L9mNRHOAXJkRWuPQWWh+dPQ7bqyeWac7yhzL/2/ZO6AUXQLkcEpF1CnOpqNOdnKj/op/
         1jZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791367426; x=1791972226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M03AwNxsc2r/rMzULNXg8D4H62RlVRMbC2QVmKzSq6E=;
        b=X9e+/L/3csaGkGPw+AuBkGEBKArDlpwW60DaZS5RZT5fTKQZdVbTSR2ylxZO5uK2sf
         +HHRZtpLWn6ZDnb2BsJnNS7wSMe13QYyhRj24mjLJjWp9ewhnM4jFaqBthep4rxS35G1
         SXF0XtZBOUXJl0OUTiXjluuOoyEWdkVv3CZ0kbzTwuPA6cyERw7PiFf1+yzD2kFJ2W+b
         OWaRLzRY7uIrPtoId9EK1IJtpWLGy4xvTy1m3gnf7+H9p+lQLQMBTrD8RDFGGsdc6Rwr
         S+gmvao6wxcu5v9VgQem3DF7khJZ3P6HQ3PciG/qPtyFGWPQjblZmL8Q3rmuT5p3cJsP
         J1sg==
X-Forwarded-Encrypted: i=1; AKwUvBx6abhb+z7O63s51ySLk8XKaEAcdVVsvlsFCoG+ZkEq400yY8EVw0mIm/bgvtA0/gfr9EbNm4m2D2EXxQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lbNe3ZZpKfE4SogMdi95rsN5hE7UNX8q9gftIgULgiWLFd2GOE
	KfMxllmwvjXbL1HCYiORUQdfMQ2JA9BWi+23ylu1jBTa0nmetgp+2vG8qyaWErHDQQ5hNVTLYh6
	bClzYEQ3qAzhOZN5swDeANp73HpI/VTEXMvjz8KhuvjPzZIw4DteNf23kDy6Ey5vrCg==
X-Gm-Gg: AYBFou0dTHGmGOSpLRObwr2V+zKD41ESNgERXbDb7pWLEwb/Foz/zxDK3Qogeuz8qIs
	b66LeFNvFwyCUsuBls92TABsfITW37LH/3q1vG6woxSXBZn7xztutplvmng8Y21xUZdE6BGAfWU
	ZnSHYuiOQxg3nb4dlKN7do7E4vjSVKXtyPlyQn8evn1ixJbteaAZf/T4eCgcDOQOkIwUI+f3qdE
	A2aeq8N7QekDHVP163e7PvHJubYT25sOdoejKtBdLSzTM2mJuv1r2NjOJ/5uw2i4wNMo+GTAepb
	jjRsKfLbkRSfl6qYYW9JlPnb4YUyaBFsDsmXfeSsL/HiE+LFT+JTj/eYW7xa9yMsOG2D5MbO3E3
	dZTFJsaNxw/xzeHCak0BWOgSfdi8b2vrQct+sPFda
X-Received: by 2002:a05:620a:2912:b0:936:e938:b07a with SMTP id af79cd13be357-93e9b345658mr339530885a.8.1791367426209;
        Wed, 07 Oct 2026 03:03:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2912:b0:936:e938:b07a with SMTP id af79cd13be357-93e9b345658mr339524585a.8.1791367425692;
        Wed, 07 Oct 2026 03:03:45 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1144csm4297318f8f.23.2026.10.07.03.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 03:03:44 -0700 (PDT)
Message-ID: <e352d91a-32fb-413b-85be-a2d30083eaea@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 13:03:42 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/45] media: qcom: camss: add IFE pixel path support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <e6a77fb9-e8a3-44ae-b8d1-76bb2494d31d@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <e6a77fb9-e8a3-44ae-b8d1-76bb2494d31d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Wb0yi6byBaaSvcc-56XV5OQZahGaP_4F
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac61903 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=uTK4J-ebKsyKmJgbFeIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfX/exVzpzo29dK
 bIX+cL7cuPJh12YdPeL9TpMy4T6WcWHRD5BRn1DAK0Zg/sY605DOF0LB1N66/LOyX8U0lYOIRoh
 ApgObU+zMDCU2YVKlFQ34OughM4FZqY=
X-Proofpoint-ORIG-GUID: Wb0yi6byBaaSvcc-56XV5OQZahGaP_4F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfXyf7f1M9H2Nsq
 akw0sk+FRMqF/ZL6qPUt7BF/+Cz0ae60idknFONH3Q4/EPT+2h9mOk1131g5O6VpSUivTuz2I8K
 neIgS8ir5TuOtndxnB14+t3Ss+poc3+Ss9F+EqM9I7XcJwyjRJeh42GxuUZqvU6CVOZgwUA3nK+
 CnAWhcROUpZekDoPuoWQCtV6ckWj/d5nnebsxj3oepAdLfHYxHbiIZjwdyOJCMiYDLeAsOGBTPX
 bjFH6PgsKcaOiR9myTxETMaHezSxiFCL9aXMC1cJ0L/gaG6pkKgQiathBwHQ0PKkAfMR2Ca+Xe8
 4CoufjNZCymkltlHFu8HFEnL1sg9VDhcXrxGto42KLU7Mm9FGgkMvRcFBP1ERhRZeqJbfuHWr0G
 ETdBCrULnhTlyvKkUJNadBqImsWCuvCmVsEMCUU9sG5yF5rJHFLGK1xcQcin6rvetim+BC5MvAj
 LbDyXPmfoiOCTEaDNCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070039



On 10/7/2026 12:59 PM, Bryan O'Donoghue wrote:
> On 07/10/2026 00:39, 
> Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
>> NOTE: Bryan has posted RFC changes for pixel path params and
>> statistics. This series was ready to be posted at that time, so it is
>> not rebased on top of Bryan's implementation. Both implementations
>> share common parts, but take a different direction towards enabling
>> the pixel path: Bryan's series extends camss-vfe, while this series
>> introduces the new camss-ife sub-device described above.
> 
> Indeed.
> 
> I have posted an evolutionary approach - shifting from and fixing the 
> original sin of mixing write-master and rdi indexing - as a first up fix 
> to the driver, and then placing new features on top.
> 
> What I don't support here - is a parallel in-driver new driver that 
> leaves legacy stuff as-is and just shoots off and does something easier 
> in its own isolated place.
> 
> Great to see the willingness of qcom to follow up on my lead, lets work 
> together to integrate your stuff on top.

I agree, lets work together to move forward on this topic.

~Gjorgji
