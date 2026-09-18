Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339D13E40EE
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 11:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729818; cv=pass; b=TqoeAeFxeXrypvmoCwwdiV2HmQsbLhKdN59Ohf/TEpghQNZHk7VXyCZDdOQy9bMOwEjARTBHNHCx6upQvXXbwSePDaliHr6d7R+MxP+GwVgCzwSl3TD6EAmPpJKIi/+wkJR2465CwklCEgYCNKxmWKtXSm4B3/EahETdQ8MJw4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729818; c=relaxed/simple;
	bh=7mYi1pmpp8N50UyfrIRnukXbXF0A2XFwLce49LgYwEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kx7QbrV/R3bbkVbeWa5heDU0RtbY7LusrySIj3qJJDi1Ittzdwc40d5EmVv3Kjgjs9H/KJnM4QFdiP+pEBDSrcmmKGOTqewMw0dg2OBUD6iX6+JYGCoMb5qIjkTtK6AJ3IHxabXkejb3Sea6sSaaVtEkWoO0Syr1nQMJeaQDVh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mgP9DmFX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gIedg0ub; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgP9DmFX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gIedg0ub"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dsNu139300
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 11:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hHGk/fFt22iEw0C1ik4cFkKxs940DakHET+Ju6KARfQ=; b=mgP9DmFX8HWxEggU
	u2fsHlEJMTq8nqwX6n/+W2q8jM8JzZBOwzbEjpc1BAuenRDbTfigAwrIVSQDihz+
	oAmp5opCWo7rbCOo1qn4s+cjO64AxZpNzFlF1qYTJNxUn5yKnPEhTpKBN6jl8dUs
	Rk6RBHk048Snhp/ujycxGmbKEnw7BhHXr8/8rMJz3foMqzI5H9yFXhwXp8D7pYEz
	a1qh+6N4KDp1XY6lmaQO/RJomZIFmk/DKRPymPFS9T/ceMgDUSS+JPm7/YEN/Hm2
	qqmMldp+QqsdR49Eeb6OqP78oAkchXL1ly/MljRT7GJ0+NZOv/uX+FWf0lPLNorQ
	Hvhayw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gry2bsc3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 11:10:15 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8823e022390so6626957b3.2
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 04:10:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789729815; cv=none;
        d=google.com; s=arc-20260327;
        b=U5YyO+P8Ac9ljXrwPD5bCbO31JdFpePwOSVcgMDcHwfuhlXgDyOruaJF9D1NaLq4y3
         xNos+hs0wLzNSpvlqT0EMGWQcVu66mxsjn3Qc1hV/EYDtTwlSFdO6SfRX1AO3YqdLY8R
         eLVnGfybppDlklfSnBWx4A+hXPjVx/PqdBccsHodFKh5WEv6ebUQgcVGhj4dsuzgCM0k
         5+REvFFEqF+AyayGuyYxq/lcrAOu5TTd+3lhd4RfRIe6KR3U2La7sRCHvi2G4MZKeP3s
         4OLmJnX+OeLOpRxwzbRh0XcG4CbJD0w522RwBqPvgrPr7B9yGwUILTFORRXzDKGHT7u3
         ImmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hHGk/fFt22iEw0C1ik4cFkKxs940DakHET+Ju6KARfQ=;
        fh=zILXfZyZUdAoUeZnp+pvxugH28+NYaamyz/l40BYz2Q=;
        b=fgm9AKNO+3BG6HI0tUUrqk+IUIVeHGMl6QdowU91XvmOB2D7/zZ9m79wd16Ou9V5Jp
         /xHWjUVyvPFs67IfmS8y+BQKxmWNNYrKKIbWxfPxWvMW+FSK83bKW8xvhH9MAwKUyRRK
         FFDaijsFI6RvfKLolAC8TQ5gQOWM+hVv7xJuOcSGBrPj3UMOzQFuqF77NhIJPAV6zu30
         Ev7usm4tqthQqyttIYgc576+p2yTGNKngvJZP2IfIqXVJVOmtfHC1MRw+CNHQD4+ZqHB
         UDwcDGSS4eGGZvoYLGDtPFSiDTue/LTAg8ccW+O50PhJIktHbcP5dUmmGTzNBRL0yOqR
         2dwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789729815; x=1790334615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hHGk/fFt22iEw0C1ik4cFkKxs940DakHET+Ju6KARfQ=;
        b=gIedg0ub5NUV/rWfSkCStuIyFYFCFrm1XCEweAYbfGcIqKD76RmJjohFpCc4TJKHpc
         0QwqnS9H6VHjnSdOsLl9XZMHgiVawLW4bBTWoVhkpnFps7ukjoRLvAOfoMgEH3iQGdPT
         OdzbpG4Td7yMn3kzV9FvALRwZ4RdYDJ7eXJ7XWY87drX/H2cUV3BfnW+AhHSMnAVz4FN
         7T4aetpEN7XWmE2cg2D0JIUQ8z5Sx94zwTEp0FiAcXFVkO+e7NJWkCe3ffWQBcSYoEvu
         LyHU8/YMeA0Tq+XMvs71OmeSSRB8keODAiYJwLDFeCYR/KFBMWk2O7hn6A8wX5J6Q0uy
         OOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789729815; x=1790334615;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hHGk/fFt22iEw0C1ik4cFkKxs940DakHET+Ju6KARfQ=;
        b=yIyc8PJ+gmeiBEWaPBPdvHvuto8HsaX4rN9zSJn6lyd0gWMv0rymUxODxOLpu5Lm3+
         sr8hUF+eonNHKK9ieXDnOzbm+fNdAGf/Wg3gvNeaoKguNzIV89cZ7QmkgxHsHDmiVjPz
         Oq6k2ddbJjLGKYtch2SoocZGnz4eFj7jlbQWDj3qj/U9dBzlYluS+l8gXeO+Pgs78eJM
         gH+1hbG9Qqmxh6bIwEtPotpMlt385+3aQnKpGxFNFNMBZbvTC4lRYcal8o5XswNdbEzK
         q0fvhFz2cR4g2pjAe0T/4eya5kql7W9YtXEIAEHiRJMJiApaGrNWvKlgWC1dhkuG1FSF
         JpYg==
X-Forwarded-Encrypted: i=1; AKwUvBwbTRbTjIngGjyxvOryGnBahTf31rHCNg2f2er+8IWrQkIp23BDgVQITB1dmmTbWwp0WqdP3DPlbchfaQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kGrnXWYpd+aU2OFT3VpderaxpV+CKhYAghCl5T7AK4w+Z6NmtJ
	vnHi8cxvFEo8G//lIK0dWhK5UKeHziEbVjjMzRrqCiTbmA/3cYdNHaNI+gdLq2ksjyeFlan+j59
	mHuj9hiFX3fnf2DWBGBji1YiTIKTOsiznnnHwJtGv/TcjIMO69q8URwpeXdv4hojr1aMwIy3m0K
	B8y48DFwDaLcVB05bRjTwcgswYvAPb7SEsPh+HymEx
X-Gm-Gg: AYBFou2pyDptVH0ZXtYmsWRgch/mxWrcSO6ftINJVlmdk9RywxuhY0E8T6Zify5E3g7
	bu225oMhINcUF4pDxisgk0VClLwrqRhOXHEPqL3fcXjUiYtwElGwiq00myq0SSJdNHxC5OSf+es
	tSzx7YpUnYKABDFUtaXIHP4m/0DxnDRcTN98uYYzMMOOuwFEilLM09ZFeAjA==
X-Received: by 2002:a05:690c:6609:b0:864:a8f4:faf0 with SMTP id 00721157ae682-897308fc29fmr6613247b3.10.1789729815295;
        Fri, 18 Sep 2026 04:10:15 -0700 (PDT)
X-Received: by 2002:a05:690c:6609:b0:864:a8f4:faf0 with SMTP id
 00721157ae682-897308fc29fmr6613187b3.10.1789729814904; Fri, 18 Sep 2026
 04:10:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-video-optee-pas-v1-v1-0-7bbddaaac5ba@kernel.org>
 <20260911-video-optee-pas-v1-v1-2-7bbddaaac5ba@kernel.org>
 <38fa7602-f03a-4343-9999-0eda108332e3@oss.qualcomm.com> <CAGptzHNO02tQJypLjQD+nKWW76m5R2fo-s=bAJhN=Hmu_oVvng@mail.gmail.com>
 <d293c3a5-7318-4ef4-978e-2bf1c064d0fe@oss.qualcomm.com>
In-Reply-To: <d293c3a5-7318-4ef4-978e-2bf1c064d0fe@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:40:04 +0530
X-Gm-Features: AcwNN1Upb_pgvF3uaRc1g74qFaXIbjn35IiykJbFBoflQjt_WLzyJvnHVSN59JU
Message-ID: <CAGptzHN5uTR8w2b3ODHoSTcys4woRBmAf0fa=93H34ZDV+=ymw@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: iris: Skip SCM call for non-SCM PAS backend
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE1NiBTYWx0ZWRfX9eqHJfO07VK+
 xeeYHZ5eEjPMtyT6eBGlRFgc9vcn0kZTGcqn7pmBR6j3+C6g8DFmYdWLjVAX3/oxIeNJz5oQeDm
 ut+VzUyEY9OkETVPL9VtBop/taK/R5/3i+efs40kBdibTGirRsWfo7BzfF4Q0glvM/qjsSgjkG2
 POVDDJwnwbtDMJ37qiIrH08PdKxp66yJoEblcTI97ANPFUCS3Zw0ZH5dS4hfRp6oJXfMT59RWVe
 XaJCoV+IbyupXIbjBV2OM1MMcevP1J8HT7+6fLZ8j30aDAW56ck4S49fdNTkYiBGEhl6ETxrCBw
 +7G90gA/1JH1B3F3Tt3s/r/VWk8T23SRSIPejgGXOD71MXCcukZ0VwPY9UU07Z3h3qHEOsAKX0b
 lQUAWtAmBas9LeBo/d0K1q2X1Q3GfEV2iReTZisCD2k4EZhOWhU84lidCkO8/83k6Ie1qoW29mE
 MZocD4pQ8h/uDAFkfWA==
X-Proofpoint-GUID: 6S-hMk2IVgp3Zr9ixeZpmJwpdzKqKJaG
X-Authority-Analysis: v=2.4 cv=bYP+w+PB c=1 sm=1 tr=0 ts=6aad1c17 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=JgrgwxYoxep7DTiRX_4A:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE1NiBTYWx0ZWRfX8kZ+7GKebceS
 jID6EyJ33d3zmpCBx89dOPu+s8yuJkmTWQ5EtZlxZeGr/pOlPmjOVS1VXrGU+nSCiz8ly1UNuLL
 2djabSGibj2aAgLdSMlmWMwxcWzy6Rw=
X-Proofpoint-ORIG-GUID: 6S-hMk2IVgp3Zr9ixeZpmJwpdzKqKJaG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180156

Hey Vikash,

On Thu, Sep 17, 2026 at 5:11=E2=80=AFPM Vikash Garodia
<vikash.garodia@oss.qualcomm.com> wrote:
>
> Hi Sumit,
>
> On 9/14/2026 11:44 AM, Sumit Garg wrote:
> > Hey Konrad,
> >
> > On Fri, Sep 11, 2026 at 7:54=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 9/11/26 2:38 PM, Sumit Garg wrote:
> >>> From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>>
> >>> qcom_scm_mem_protect_video_var() is only serviced by the SCM backend;
> >>> with OP-TEE the TEE owns secure memory protection. Use
> >>> qcom_pas_get_backend() to issue the SCM call only for the SCM backend=
.
> >>>
> >>> Assisted-by: Copilot:claude-opus-4.8
> >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
> >>> Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +     /*
> >>> +      * qcom_scm_mem_protect_video_var() only applies to the SCM bac=
kend;
> >>> +      * other backends (e.g. OP-TEE) own secure memory protection an=
d do
> >>> +      * not service this call.
> >>
> >> Can you not just stub it out in TF-A then?
> >>
> >
> > Please don't, we don't want to support these random SCM calls ABI per
> > subsystem with the open boot stack. All the config in this case for
> > video is handled by OP-TEE itself.
>
> Could you please help me understand the demerit in stubbing it out and
> let that be a dummy ABI in OPTEE world ? that way client driver can
> remain agnostic of the calls being routed to OPTEE or QTEE
>

The main disadvantage is that we don't want to carry these custom SCM
ABIs per kernel subsystem with the open source TF-A/OP-TEE boot stack.
ABIs always come with maintenance burdens, especially the custom ones
we have in this case.

Since we started from scratch for the open source boot stack, the
motivation is to keep the TZ ABI minimal and that too with
discoverable OP-TEE services like the PAS service.

-Sumit
