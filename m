Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C787E3A1CEA
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 06:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789366479; cv=pass; b=QbfObzBQ0fCog4hIgH3PDmEHgxHFLADsFLW++IIGRBkWSUGLi3bNy3+70N36WZ/tzLeoraxABEgdMc0KQ/baerYjPS7Vkejk6UU3GsF5cf/VXSlK1PSD8dihytoozDZ9JlTAYPJFfvKVCJWXIRxfbNJ1ObVLFxY5YX6BlJ+o1qY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789366479; c=relaxed/simple;
	bh=k4xfR0PeWNxd/reUF6upN1QRUBTuiHQNijGzhwYPpu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nD4fHkyqd5E3FIt+xtQyhLLsl1y2AT/i3+cSq5KO7YqcPSe0AVQk3D2UodqvryCg6IY+9ukjykOtsu6VlwSK9r4hi9NGwiIvDoWP0dD+7i6rFCZClI1ghLEWiT+Sk/hSYFIPH43RxZb82PLXN78H4DA22xrlvp78LAx74WbSPFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVYm0btx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bp/JhtEp; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVYm0btx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bp/JhtEp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5isfa4058198
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 06:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iyi/5oCNoofAp3ld0Zs7sv83wQk4jpokqi4QcSkzluw=; b=PVYm0btxLAUVEefj
	MFjGUCqMsofjo/3Sljg7waqF/TlsXwon5zrbN4AUw0HMwsfIIaT3VV3yGGto0AyL
	YZfUGZvaihpNmPvRZhxMMD/57MrPEbQW90J6qUO7ZnGwG1iJU0G8ilpTb6o+EKKx
	Tn+N6QQNqHqIFNTMMt5QmwR0sdqVU0KGU1rvmgHwL2ZplrGrnsZogvae2dSP4Lbc
	NmkLO9kohiV9j/LXb2V4u434iEJ3ZjtA6/ciAhqTpUgS0C4WXnT+OqlAItR04tcc
	cECi4WNd8oB1X2AOK03AhFLQ8L+rUU+VW4ZIYR4uTJ2Byp9slybde8bWBZzdoLIY
	OrGRyg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hss3hm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 06:14:36 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8648f12d52aso42998967b3.0
        for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 23:14:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789366476; cv=none;
        d=google.com; s=arc-20260327;
        b=NMOGedaoPuBQmlogz8aL/HymBpU0fdWvWr5+RFoEKqtDgKqgipaAtHVe9ylcQLspqS
         lXYD3W9j2Ze+TXGKcmgtvEc+zghu7NANOwiTAkAPsP4s3NLQyQFs3r4Ta/9IgCxtBU2C
         W7QA9wvC93w0XapYissBb7QfbiPA6bkII4sWIGPxKh5DgtlEF1R6zZWAnyqkRacOmWfp
         2v8d1z8KhDu5aK4YEsEnabMBF28VSrmaDQKHxXqQ9rXBSCF5alw0//1TOakS1hxlrMxk
         WZ4WffUjjbZQParSbmIXWBK82AHxvuALx+WoEjyrgO+PfJbHB/HaqmPxS5ugfqh1vx67
         sXnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iyi/5oCNoofAp3ld0Zs7sv83wQk4jpokqi4QcSkzluw=;
        fh=hJvFaafEY0EtsnVfOVZBWqsbUydXzDYkKsZB7WmzggQ=;
        b=ppZAILuLbsIZd2E60uJ32AXRN/RZhBxX0aAAiogcCUo2V7NNKc+UXvw6JH6aMH80D/
         hjzWOxn97/L1q+A6q+bjgzekTPTgsWVGBKNimNNNZUoWc+B7TBjoKzeuWpSAOdnxfm+q
         qdnTjm1i8PfnRmLzhXltmgV2+1YK9P5S2b5bAve4HRbEMaJMLtX8okRkMiX+0SFLcW9Q
         gv4D/hNM9qDpejqECfbOAL7igijXw9dkvYsyXUjr/xkvf/yxCvxVngxxTUx+jepP6Z3o
         ADvqj85ATfwN88WTU4D3iZvKKEq+Uh6LCzYHNQSvrSWJ567NaMgd/DE1LRhDuwTkt66k
         xv9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789366476; x=1789971276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iyi/5oCNoofAp3ld0Zs7sv83wQk4jpokqi4QcSkzluw=;
        b=Bp/JhtEpuCrjRDQP5EmYJHuPzIMOP5BSLwKCE3nTfm8adLme1zae+FeLuiEf/4PaIF
         NlVndRJ+qWgslH5JJkNr1u0NF3dgkRfvGJUd7a8yHUcQ0ImxxzOYfIAF2W7TL4WLViEl
         h8KOcu9KVBngi0B/rcVyNwAvJPmO0hrGRhT9J36mqHL23ZAc33Qsk/V6eX2fC9qR7Vlt
         tQ1f1wETRrWQ6i5HoZCwGnZw3xIFlaVDUze6wcU+8JZ6WXhnBPA+RsHovN8XKcDd95hL
         Ci2Jqbq7Si4QN0wCYOcUGgF/WFJQ77+ElZBVV7Tj97nerwwsSsybFXGTFK/HImw7elmP
         7aGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789366476; x=1789971276;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyi/5oCNoofAp3ld0Zs7sv83wQk4jpokqi4QcSkzluw=;
        b=mZJiHFZ0V3Tso2EC35JkmjR7iq9PGMLc8aCHHJtrr9nTPvRwE3llWG+yWLsQWc1ynW
         eiKA3cBgXM/jBDl6zMqBVo0nHxdq6NbkR/OQM2EGdikjjM/fAbWLkOvay5e3Zrzl4u0P
         2eXYK3yNCutO3Ih1TQacPbX9clejBdD2uMGODIYaK6UEjjFJb2xCwL5mio12XryUIhX6
         XfnxE5vPiMFsLyD/rFUf8Ns5XYmETE6YtON92qFxuUo+QGbM2mVrls+hbZ6q6wSOe0vZ
         SrBwfZ3ZklKKHZOSBZ3mHP4qEXhlwD2TnYWo6xry26keioaib2V1CbaqqSEW8+yoGxf9
         4ufw==
X-Forwarded-Encrypted: i=1; AKwUvBxrv6V5au1sMZoTVMl2YXBFilgT0tXXMfhoUMJqgsVLkwrE4ssbyO2FNzWh10xv82BuzobkhN/7ZZneNg==@vger.kernel.org
X-Gm-Message-State: AFuF++lJlqqbjZHkelfS629EAlgJexktNrsYVFMnUL3g8ez4Qc3KDvVi
	Jtife2lpyTrhtytV8Yz4mKsPx7HV1TBQaRL1I0sxJ4gDHJL9OWR98w3Cd7Wxl29q8q22dPXYxps
	K72DzUFpfcNJ3PRrtETyPOS0ujvelnk0qgQAoSGF+OKrULPmhSz51MiIbtrc43nRCGUkml5+Qxv
	tMgbDp7QmEuovwTM2U16sdH7YNB0Qk1CUaWdlaG/Ko
X-Gm-Gg: AYBFou0MTW4g5R7nN7FbL4RYaKdTV9RzqDH68HcUpnE+yObRHz584OoweEx5phyZYlK
	fQxU84VvrmuYmiJErgQJD6InQydDs1e/ZC1QHzWdEPNjL0M8fypXMB0BRbuDAtJBf4iu7iK4/qc
	V9c0Ch1BbBkfCfKKUrD8+s3WnmCPLQatwvB1GXOSCMgo68pUcJqmsgkZ2OPzM=
X-Received: by 2002:a05:690c:a194:b0:88a:99a:6ef7 with SMTP id 00721157ae682-88d429bc2cfmr1481207b3.29.1789366476014;
        Sun, 13 Sep 2026 23:14:36 -0700 (PDT)
X-Received: by 2002:a05:690c:a194:b0:88a:99a:6ef7 with SMTP id
 00721157ae682-88d429bc2cfmr1481177b3.29.1789366475619; Sun, 13 Sep 2026
 23:14:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-video-optee-pas-v1-v1-0-7bbddaaac5ba@kernel.org>
 <20260911-video-optee-pas-v1-v1-2-7bbddaaac5ba@kernel.org> <38fa7602-f03a-4343-9999-0eda108332e3@oss.qualcomm.com>
In-Reply-To: <38fa7602-f03a-4343-9999-0eda108332e3@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 11:44:24 +0530
X-Gm-Features: AcwNN1WMz2nu0585ncfAPT356zzZjVDl_ErD0iCxDirfyWquSHbcFRVIWjnzCME
Message-ID: <CAGptzHNO02tQJypLjQD+nKWW76m5R2fo-s=bAJhN=Hmu_oVvng@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: iris: Skip SCM call for non-SCM PAS backend
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA4NiBTYWx0ZWRfX5a603dohu8/m
 mYXiXQGk8iJWEVEQfFEUF2lB24GkTNr+Nh6Brw8So1lg2geLl9BkNCHf9NVKtOOkP8ImbhoAEdH
 n9X+hyiOS6qZw3unH1I8ZrJufbC6KEqM+o6u2yQJcuHLD08Qqp6IronQZ3FYJqFciiq1KVeSjt6
 dw2s95p5Pq4LPGAdqiRIYhzgP3X8VomiZbryUwbbgsupOAYc21MSLm4pc19gJ31y9DAMWwe7MEQ
 /TkmIM5k+kbz7sw22heg+oIsX4oAQ0diyc8IlN5+Colr/KJfAGWORtvHoBBbAq011B+dRLNdW3e
 T+vxI9ixjRL6tSWetZgJ2LANQJ79+vmRX41eP2k8pIz2BUQESGA6XLCAoTTUlW+ICTgTGJqC7sS
 WOSCogtst9EVEM149FLQi+OtL2fH2tgMkimds997IHsTgjRTGcWGKCDnP4iID61PyvXxtTC/qCp
 uAA1teDZiekw5N+1M2g==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa790cc cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=P_Z3VnmZX6NCh_LFz34A:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: FTuzqrHE4ykiRwZSAshjeGp3zNX0MOnH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA4NiBTYWx0ZWRfXyBd83QEAFH/8
 AG0sTi6f4HjJ+dh1D8cL3sg9y7Nt6EHQF/WUuprhXxJFmpBkWR3mUAswXB84re6P62f5OkEu9T7
 hY47drN3RYHpDjU/hoim5rVW2GjQJbw=
X-Proofpoint-ORIG-GUID: FTuzqrHE4ykiRwZSAshjeGp3zNX0MOnH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140086

Hey Konrad,

On Fri, Sep 11, 2026 at 7:54=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/11/26 2:38 PM, Sumit Garg wrote:
> > From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >
> > qcom_scm_mem_protect_video_var() is only serviced by the SCM backend;
> > with OP-TEE the TEE owns secure memory protection. Use
> > qcom_pas_get_backend() to issue the SCM call only for the SCM backend.
> >
> > Assisted-by: Copilot:claude-opus-4.8
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
> > Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
>
> [...]
>
> > +     /*
> > +      * qcom_scm_mem_protect_video_var() only applies to the SCM backe=
nd;
> > +      * other backends (e.g. OP-TEE) own secure memory protection and =
do
> > +      * not service this call.
>
> Can you not just stub it out in TF-A then?
>

Please don't, we don't want to support these random SCM calls ABI per
subsystem with the open boot stack. All the config in this case for
video is handled by OP-TEE itself.

Instead we want to mostly support any subsystem specific TZ use-cases
as proper client drivers for the TEE subsystem.

-Sumit
