Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DD73DAC02
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 21:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787261515; cv=none; b=W04iZk3HEcLvm3zWzkcdsoEtzQ9s3W4xdZz8fOwoueQfDjKS4OzvgFIhQ/2yuxA6ZVZNp91gR67HFR8AFPPXgc2WcezmeXutNW8WO43BPvNwkYIhwxpie3V/+MjvJlwVNuFSwjiy58jQiq8rJmN7U/kl9LXw7erT2AOJzU/+P20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787261515; c=relaxed/simple;
	bh=naiWZpjPQyIWAHRMmLYKgVKDQqIXbDqyYaHRjdGPyO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/7aaGhNaon9+Hm/90zQ/6mH88IslMX6yt7H95B2e4pehAIbY3DPbD5/XpPPPcaH4dpg/QDzjWMooZUeMLQR+sa+kONGqqK0elWibZ7is5RGkd5Aqe8Mqt3ftuZU2PiKIstwR/3rc09bUrHr1afitvZHiH5DlI/4g8rR8iPQtos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SjZHIz1w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=epLoq4G7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjZHIz1w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="epLoq4G7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK7gV2587776
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 21:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cr2C/xP5GrZuVgcPlXC5GKAC
	/6P2elIVErTKuhwQVig=; b=SjZHIz1wLgScIaPzwW5mdIGIgmwHa92patpst/dK
	ju7ZyaRBCyiXHjMzzURO1OEJxpyMK12Wj0IIJbEVeJoPF23xn18DPydFQXiyJBBM
	RC15YV/mLUfi8opSdHmaMOrNCmHwgEfwWf8bJJIY1azNyKjiLUIGcu4MYvyTwQEJ
	dob1ddDY8fS++Hey4hq29Q/6JejD9xR8HuUE7U95yovUg09PSMme+JrF2ZDO9yli
	VOJ9FhtMZZFVi/SKw4e/GIzepKF8Qu61kN2uMn3H2EnxqylM2RyHBOoCarUGgwaf
	RPWPLBBSkzqrg60XJ7hQgQKYvK8weviu6VA3zMCA0/QwWg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg8b16p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 21:31:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d137a68so5296861cf.3
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 14:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787261508; x=1787866308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cr2C/xP5GrZuVgcPlXC5GKAC/6P2elIVErTKuhwQVig=;
        b=epLoq4G7W8Ivs7iCXv+3ZS3rdRkToluiupoj+56vM6rBpdDtc2NHxvzPPy0TSrjFv+
         +PaeZAnoYsryYDaMjwoZcs6CFqKUmE/hNX9C7MiVfNvGMKLdKxGw6vlmpsocKyQlMbgw
         1Ro7uJGUExjLuZdfszgURRpHvL4gy7tttmj6ft7lk89LtGB0Gj6xGEfT3HHKwOwrpID8
         0sgPePACyxflKU7tIqc0nv1Mc03JwXXlapWC42ThubbcKwmHCkZoJwV2VtBv7UBPrrHu
         8D7geAArfRpBTFyKg2mZPClxv6KQBX8L8m6UrEnMX/q6FbvuW8AJZI2EoxAk86u7Tt1W
         UcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787261508; x=1787866308;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cr2C/xP5GrZuVgcPlXC5GKAC/6P2elIVErTKuhwQVig=;
        b=hpt0WOXwg2FrSa+AoTf5IA9R8hoXhQTCub6JI/4a6XgqiQKEYe1LE0rFpqWCKCzORL
         oD/kpH10hUwaY64bGKrBpC/ekTu6PV49JYxp/pdENuuO6dmz5Zwft10eLHlHaUEtx62R
         kkEoPhvZumljmvYi0w2prm8sI5MN4L9szaTaDBMxuaJuMApnoeT+EkToSLebT3IcQLE/
         4OM/jsHfFHQQN3taHdRYnh96PAZRTd6TF2pvxnr3PYquafnH6WyosVaBkP/Txbm8kgtj
         oYXkN8vGF08H4uk9sa4QJAFWLrX7FJ9KqfkpvBiQy618t5tx3qSA1Ifzw/jh0cxDtxKW
         66ug==
X-Forwarded-Encrypted: i=1; AHgh+RqMcnV2XZwyt2mY+u38pUH7qQDgI6WuxdBNyQXyMQjHHFPCEPHii8fNpVH/mONJfuyBqKbaba72TbIs1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxujn0l6BNilOfsgwMSXDdzQ1nopiOyDZZVzgS78+lX7isAW2Qa
	QoDB+eE6giKDQfvN2Fob3Bq+tpuFNJC+wP2u54Z/fK9MgnaVArQl09G2uBPFEuXRDu0TBTc+Yz/
	PGyekCKcP0+KTHgJ7lGEOw1JWJM3HL13EXaxLOkJBttrjw5UX05aC7PB7Q4f9rDuSZQ==
X-Gm-Gg: AR+sD13vjL5oBxjh/Vcl8XVGnuLgPjuvBCkCyB9nG4FNwV/fdlr/l74kWbK0xH6JtGN
	wb+rcvG2hUDYiaMNJ2IpG3gMAt+6MtFQZ+f5TeBMaIrrGhiaVpgPkB8mgLPa1UILRbcwyne32ot
	RjSFoFhax8WUT7W8IRxNoexaiTtfm259Evn1QBZBaKolMsQKtv8BXuY6FiiuMec3NWhTN2vN5K/
	IbwTp3dzCd5wmO5MiJdLsHeXrNAXuwAZ6N9Y4ekH/htANs7MootJrcmFNNdwwIoSnRAZwuotE3i
	UNY+E5UiKDntBMQ1BOhYiL+jCLUFXS01cxi+ejP/urbd+9Ur1IgHHR4wee1su9JzaqkzOn9kiZR
	7VXJnwL4+8m07tH+WFXpQSJYU9aSnJRe7YF4B7ZKwufe14eE5h733e6YNufzXLD0hLnHDIO1URm
	8vzZUqQEndZt6k
X-Received: by 2002:a05:622a:5149:b0:52d:9be1:18b1 with SMTP id d75a77b69052e-52df5a809a5mr15223501cf.44.1787261507938;
        Thu, 20 Aug 2026 14:31:47 -0700 (PDT)
X-Received: by 2002:a05:622a:5149:b0:52d:9be1:18b1 with SMTP id d75a77b69052e-52df5a809a5mr15222841cf.44.1787261507442;
        Thu, 20 Aug 2026 14:31:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4788615f9sm1492904e87.36.2026.08.20.14.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:31:45 -0700 (PDT)
Date: Fri, 21 Aug 2026 00:31:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Message-ID: <x7aje3k2jdf3skoafyd7ehteym4os4zp3y5hdavptjl6477oze@zsrzx763r3he>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
 <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l>
 <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com>
 <qje2bZKWSzkQQGDw0traOE7SqoXhCBLeDrilCooH6Vh6cYeFWAh_VyhqspJuzVs3iA4ye2U75aZHsVGorNPjPQ==@protonmail.internalid>
 <476aee61-015f-4793-9be7-a102c1c3e811@oss.qualcomm.com>
 <3e8b2574-eab5-4c34-b400-c75312b9a772@kernel.org>
 <mpiuqkxaq4bvz4pc7iug3aoar5jkxz4tpetbg72olrzfar4zlc@w7sgfwfksl4r>
 <cff2cfb1-619b-4f93-b6dc-f7f34a66bdec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cff2cfb1-619b-4f93-b6dc-f7f34a66bdec@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MSBTYWx0ZWRfX3THkO1nxFoH6
 O1YPssjnEnsOgGxMv3KtRaFsoKA8admo/+l5HF8rYektvuRoqSKsg+kdZrKgEjs5GPcKzs2/B+v
 JpV8+LoeXqKDROIE5XzuLD/Nqt4OWEg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MSBTYWx0ZWRfX80i1NGi3mDmN
 seqYfGKi5fDm1g/9MjXYg8l2R+WohxxYFw42cNTFEIdIo9PN9fDZkayIM0GDY1QF43ZlNZIs8xQ
 enSSXFfaCoxNznBqoRK6AmuhTLJ6jIMIsNOhebmFOu2JCu1lJlAW5tqN3S9B38vD9wu5cs1zIOR
 2fEoOR3CTWAJ4toRprYQgt/A2gFOugdcmNr9rsQRhZMu0h8YiWXeNfkdT1A27qBqxR0Jpzq+34m
 wKB8Qwww0iOzswf7nTHFmrTYnkzrW0vHe4/Wuo/H0EZCMFsU0xJb37FmJaAjFybr2sZUASyrGMc
 MQi4+oOyB/88ast98+n05u0Oe8tWy87tL3GPrBfoq2ntqwOKhPFv/gx4pZ6d0M9emVc2lI48mt5
 LCbxG4o1XsU+7n7K6X4MKbdfDrJCt+IoSfGZjx8DJWdIl5TbeOMHLV7JIp5FN4cTdw75JyOoAcz
 2LEkmLZTrvLVL2RawAQ==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a877248 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=nbHKUmjyE6MJwsPo2nEA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 9bAQc71QKTfw09DRFIOsG9f-TIH6iobU
X-Proofpoint-ORIG-GUID: 9bAQc71QKTfw09DRFIOsG9f-TIH6iobU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200161

On Tue, Aug 04, 2026 at 08:44:25AM +0300, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Dmitry,
> 
> On 8/3/2026 10:09 PM, Dmitry Baryshkov wrote:
> > On Sat, Aug 01, 2026 at 11:04:10AM +0100, Bryan O'Donoghue wrote:
> >> On 31/07/2026 20:30, Gjorgji Rosikopulos (Consultant) wrote:
> >>>>> Is TITAN_TOP a part of the MMCX or CX domain? In the former case,
> >>>>> please drop separate mmcx vote here and let it come through the
> >>>>> titan_top (it might require camcc driver and node modifications).
> >>>>>
> >>>> The change was requested by Brian, most likely in connection with
> >>>> upcoming migrations. I think he would be able to explain the exact
> >>>> reasons. As far as the facts are concerned, this is not currently
> >>>> necessary for the driver to be functional.
> >>> In the documentation we have this jpeg block need only TITAN_TOP_GDSC power domain.
> >>> However Bryan request to ad MMCX and MX.
> >>> As i can see same is for csiphy. Maybe is better to sync with Bryan.
> >>
> >> Check hamoa - I believe it is the case there's a separate vote required for
> >> MMCX/MXA.
> > 
> > Assuming TITAN_TOP gates MMCX to the whole camera block (please correct
> > me if I'm wrong), why do we need a separate vote on MMCX? I might be
> > missing something here, sorry.
> 
> Honestly i really don't know, i am trying reach to correct people(find proper documentation) 
> for this. From what i have in the jpeg documentation only power domain which is required,
> for jpeg core is TITAN_TOP for sm8250, i did not check the other platforms.

The question is primarily about SM8250, since you are adding support for
it. 

-- 
With best wishes
Dmitry
