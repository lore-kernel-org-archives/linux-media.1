Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1AA427F8D
	for <linux-media@vger.kernel.org>; Mon,  3 Aug 2026 19:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785784187; cv=none; b=Jzv8/rCgMiJtRKdTiwJEUFyWstSwdevFPjXf79OAjyWhGhtJqZ6WffYeCZ8B8Ai3iNYeCjAP1EGERjGFDBeR5N1+amHWz2pRaZsuQofbQ5+Hm0MFxhifixPiAEB63N15aGvIz+SD+0VbUwL+a4kDFuxGlSavI5YIVf6Wr0Xor+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785784187; c=relaxed/simple;
	bh=Rmmd8CUZrD78yp5jRVGRccCxdhlc6zmp+lGG+y3hdO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsHYf/+fZ/g527hF69amyuFqzbFAZ/g9/r+tyV2zm5rE062V8L1e1IRQSdGLQ52CYCAIOsKGWFNaokt+5lM3Cr/kJ50QuIYTpHKdtYIvuwmsjO9JYu7Exa5rtFRC6TFMxzX7Hg7uvQByr2sUfUTXIV6AAGBwiW988zBV3xbboq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lD42B0K2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W47+qji8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lD42B0K2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W47+qji8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673H6kwg1376800
	for <linux-media@vger.kernel.org>; Mon, 3 Aug 2026 19:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rGz1Y18dNb/KJayXUCubJBtB
	boeTWds/Oa3F5Jt8iv8=; b=lD42B0K2m6dfc7LWw6YNsNbUVPlGXSCKvkqOEzFi
	SzQcaL+ZJAHyKrQYjDuGaN7Pvk7WwE3Qr1/Znix5vc5qEJ7d4466SYRSTWKTnhlA
	8U99Qpw/Bhe22Y9ORrCH3b2ixsmXQ/vMMsFr5pA8mPFcMcgH0Q0sMf6yO8Hdoprf
	CYf/4pCAs66Ggk0GfXdtN+OT/85kPfVsxIriAT47z51Ca8R7Qe72Dmaxp/MUjATy
	KEKc5pXKaUBwxYyCEhQSDSpCSqHd6shPytUnjV9+j0lIaGJidxYmh29pz7DIaA52
	0lYwnyrjntyDF1VVjxp1NPg/3bgyKjaTIo/o7drldDb85A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3r0jaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 19:09:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c12e43b98so39882851cf.1
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 12:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785784184; x=1786388984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rGz1Y18dNb/KJayXUCubJBtBboeTWds/Oa3F5Jt8iv8=;
        b=W47+qji80W5Z0I3S3VynSGYbqs5YLdWRHMyDHaC5sALW4SQ/Wo1Ds7/6y1HwXm09kq
         vzMU2gP9UG+QztRyZrqf9YsZLAbxG6YWFZdQ+iX746GP2Q8mkjIU4ymYjEcAorhVHApA
         cd/TA6F+700g162JDlbEFhqQyuZxX4hRRDuhhl++LIMVUfVGgfW1WtBwcn0Yl0Glj8Em
         K4wzGtHtThb6+FURanptL0XYHn007GwCyOCppbWOmIRuo3LvnjpzEug8Qa9mXqyUI0Hn
         9r/22iYh+Ooqy/JkZsUrw2iVLquutXEuIey1A987RvEV7U55aA9ZNgdyph6L23Cf8nF8
         L50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785784184; x=1786388984;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rGz1Y18dNb/KJayXUCubJBtBboeTWds/Oa3F5Jt8iv8=;
        b=BUBzvL/EV46B0qndCN1NbTbBBnpG1Ra56W58kUT8mbZ1CzqfEJKn9RRrKYNglJO8Ec
         t0GwAyKMzBdscYqPp5oZqXUQTLEWEOwx6annPw05uIqNTu3LfrpLGEylmcYDC7RhF1j5
         S82UwsNOd59Y8Azfes21Kopza3cMh91bqwOCTje1aTJBiDjjUP9HhPvkozClnKqx0eke
         z421w2gR3j+7IqMAYQd1Soebs231U9lr9Kt59j+BYxfuS/32nZnjWjywnQA8lNvcFUv2
         0kzdijQcrH3J2wcyCu14MzEO88/N9pF6gf7iiz2X2+DPpb57iOVfzZuzkrXWxQOvarCX
         srLA==
X-Forwarded-Encrypted: i=1; AHgh+Roe3XFBMWp1SHDnS6Tb0Nf6mAPljhRS/qGMSxw+2/+lFw0VKAztGRfQ7UWb1Wyk6CNnZwgJT0pXi5zxVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbdD4Tk+D5Wx3epYAsvMY3+Trt1446G05EJ/x2fkvSkEpyO9CD
	bAAoyNacx2smxpqP2m6vbzWmZb9rJ0Ug8MceEAGEYeCF3sJjh+ulLHLu3WTVAaNqGHiXgKuvoGc
	GJ8qAnyeQdnB5IffLqNt5gWONjr4NfCp5wraJmhwqDMWHyd2DpUC6bFFajidiW+z+Zw==
X-Gm-Gg: AR+sD12KBMz2PRnd4onpkqHJJb3udpktTLFC19Z9Xk54sbMYEt9jkFI24OgbTYaCEhW
	9gbb8ejtqCj8DG3G2v6XK/6K2xJDjJJje3WbW8zmoPih8lcrrfpbGRtxRe7+cmkojrPl5PQi2bG
	CtUErufrMGNQxtMCiimfeHMyyK1XpMUmZpzA1NXsAC3cHMcSuRR2Jjj6oR6ctmfx1+EJLNxH7ng
	aLe13E9ARS749Q0XPMYB3cdCgSkLVaDreHmxXMV1ad61k5i/FZ0/98ooptEsKlXgpSnPstpv5jP
	ItYh/7CA1dsWL4iaTQC/PEJRtrxV9qqnzUYhNKEPPm6MF0x3adaG67mSMSO34JyiTdJGXS2HsM9
	uEeuXvR8vWUCYjrp+YU5ahzHwbwxAXqwSoEuo69ZBhM8Sp28RNL/SLQXL5ENfQ0wXpdOO0DbzUS
	gsSRqf55/xBxbWBw==
X-Received: by 2002:ac8:7f45:0:b0:517:78c7:d93a with SMTP id d75a77b69052e-52b567a8c0emr202339881cf.16.1785784183885;
        Mon, 03 Aug 2026 12:09:43 -0700 (PDT)
X-Received: by 2002:ac8:7f45:0:b0:517:78c7:d93a with SMTP id d75a77b69052e-52b567a8c0emr202339351cf.16.1785784183434;
        Mon, 03 Aug 2026 12:09:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23cbee2sm2211688e87.29.2026.08.03.12.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:09:42 -0700 (PDT)
Date: Mon, 3 Aug 2026 22:09:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Message-ID: <mpiuqkxaq4bvz4pc7iug3aoar5jkxz4tpetbg72olrzfar4zlc@w7sgfwfksl4r>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
 <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l>
 <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com>
 <qje2bZKWSzkQQGDw0traOE7SqoXhCBLeDrilCooH6Vh6cYeFWAh_VyhqspJuzVs3iA4ye2U75aZHsVGorNPjPQ==@protonmail.internalid>
 <476aee61-015f-4793-9be7-a102c1c3e811@oss.qualcomm.com>
 <3e8b2574-eab5-4c34-b400-c75312b9a772@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e8b2574-eab5-4c34-b400-c75312b9a772@kernel.org>
X-Authority-Analysis: v=2.4 cv=caPiaHDM c=1 sm=1 tr=0 ts=6a70e778 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=oQmaG_OvwICbMNobdCMA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE2OSBTYWx0ZWRfX1vzwLqGkjIpW
 pMHiNtrAXuxq44ouHnpxJDjo7RJWcnGPAQG1iHlkbLavxGv2DnXiiDrQfTvcmTaUSGO8I7ZkrLA
 nLBhOSZ/J6Rm9nvbeiEqm1hzVzG9JuE=
X-Proofpoint-GUID: 6XFJ-kwE61ig5L-39aGya43lfC69QUaf
X-Proofpoint-ORIG-GUID: 6XFJ-kwE61ig5L-39aGya43lfC69QUaf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE2OSBTYWx0ZWRfX208wYfFnkQZZ
 tYwkw9d8CoRcvhZglOe67waM/Yxb4Mg/wOWPZvcVBSKqIAJdoUMIZmjVsBym3jIWMZPGmGdhkyO
 jJtZ2DiHpS752CZ11EoWw7809Dhg1CmAPWOS4wYX6tNWRIKekThJFe9nbz1Lwn7bnXtCUYvbfgT
 OODT2qkTFn0ABoj7m8uCJqUK0yQYoL4tT3rf1zaxxnuMTTRKv2hnux1rjs7Q9N+BEy9RqkHo/5A
 UuzCO480MZaKXlvuR7C2OlRNlofniZ0EZLOWt404A1HHnFHUZEOgwfdLp6BwWYDRHK8IGVWyKwS
 WQc5pcYKPGd7kSNEllZ7FtsuXdKCO3hThvySJb8yaXIFABMx1wMRq+cWuVoc0cfpBKMcoWkHflL
 T1uoZGIiSsb7xjYI5cD9V5c0ELEO01LbXSys0QwBqv70TwajZeBd1L0tJAQbD9P4u971AZj5M4j
 B6jvE8SANhSiUrmj4AA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030169

On Sat, Aug 01, 2026 at 11:04:10AM +0100, Bryan O'Donoghue wrote:
> On 31/07/2026 20:30, Gjorgji Rosikopulos (Consultant) wrote:
> > > > Is TITAN_TOP a part of the MMCX or CX domain? In the former case,
> > > > please drop separate mmcx vote here and let it come through the
> > > > titan_top (it might require camcc driver and node modifications).
> > > > 
> > > The change was requested by Brian, most likely in connection with
> > > upcoming migrations. I think he would be able to explain the exact
> > > reasons. As far as the facts are concerned, this is not currently
> > > necessary for the driver to be functional.
> > In the documentation we have this jpeg block need only TITAN_TOP_GDSC power domain.
> > However Bryan request to ad MMCX and MX.
> > As i can see same is for csiphy. Maybe is better to sync with Bryan.
> 
> Check hamoa - I believe it is the case there's a separate vote required for
> MMCX/MXA.

Assuming TITAN_TOP gates MMCX to the whole camera block (please correct
me if I'm wrong), why do we need a separate vote on MMCX? I might be
missing something here, sorry.

> 
> I'm prefectly fine if all that is required on kona is titan_top_gdsc but,
> basically I'm asking _you_ to go verify the difference and come back with an
> answer.
> 
> "Not required for Kona we checked" - its not about being asked its about
> checking what's actually required, I'm highlighting this because sm8550
> perhaps and hamoa definitely are different.
> 
> All of this is in the power-tree documentation. Please find the place where
> the power-rails are stipulated for venus/iris and then check to see what's
> required for the titan block and represent all of the necessary rails in the
> jpeg@{} such that jpeg@{} can run standalone without any of the rest of the
> block switched on.
> 
> I'll trust your diligence in that.
> 
> ---
> bod

-- 
With best wishes
Dmitry
