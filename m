Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC693E2AA1
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785487174; cv=pass; b=Sj1u6CwtmBC4vwcaKJxDFW0VIGG5DW7ZLQ30ZAUX+ktpqAk6mOQMRz+zFvpUSsx7PM0qERWVUwNc2l05tvk3fUIZwVR77aPW8HP1Ob4SE9523B9UjrokP3VKkBPnSHE13elI4Y3aodPbL8rvSTMg+wkyusJrjdbKqk1z2yOVZ8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785487174; c=relaxed/simple;
	bh=0nzV3Au5hKldE1LyXy81nTzzO98zLS+bllEvCWCXyh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FFwuWt+G3UKZDsisDQvCcalIDCgu++OC87O7+gIAr1p2b4heQBW0MpzHFkb1dufegVitfR0X7wFHdwZcxkeRiPvZ/b5XaWSlzRBCeB3QSzBCq8+k46YVhWBnYMUTiqd9o8W56fkTJC4nJT+xIDyO7x7i2xxYZ9MabmH/hKxg98w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y0426o5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zm+5p/AY; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y0426o5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zm+5p/AY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8ZifK3675540
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0aS3a1IldF5Hbms4X/oaN6dyR7C27AUylN470557Iek=; b=Y0426o5DtAmpV+CI
	pa9mC3woijvQAOSlCbxssCTGjzH/9SyPVjH1jOdc4ONy7HX2LtjtlCQZV+pBSORq
	BMyq/waKEb9hCO9u1nC+yzqk5caF6dVBfg39rEORc4E3d2GR1iJnWThRE1Ynue09
	5ebW5LPfCkp+baXesyO7CTvBAVuI4r+HRlj7S+l8tX42yRy3/qGBaS4hm4xnJapX
	zj+ZUOXWxFNFl6VWRYa89+uKWtPxfiYch5T65AY3hoQSRou9jxqZBw2oLajdiXPX
	nSwn4106VfDFAUzryNFM3GOgDiJR12oimHPrSoryWJ3NgQCOkmKERuam0pOUatkh
	GEvotA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frrb780e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:39:28 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81f8ba7885eso23219297b3.2
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 01:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785487167; cv=none;
        d=google.com; s=arc-20260327;
        b=eHbbjAgb9ka9aS9ki7/lWFoveGrM+vl1EUgAQdGbkRwmzdrWcyaXjGIIWrw/hgXfus
         HweWzNcDtI96EMcYEeHZRenKkgZjy98Spjf1rxigm61hwH6aoPgTP/oWLK+T3iPcuAO1
         WYVlI/IOhm5RU3F+5SULaB2jBIpiBnDtL7r+lXYJwdGoW2lWRu5n9CZmRdKvtz/Q3cha
         C5HTR1UU7WDFVwqtUAG62Y20t/qK1B06NI9oaBTAQpxBEVj4ahRW3VRtmVdD3FWTuwvb
         QODEs3JO49cR2eLsS/vDht+nY0vRL13fUvtDhChXtLahGuAvXyumWELfQ38B3t7ihLNJ
         ZOqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0aS3a1IldF5Hbms4X/oaN6dyR7C27AUylN470557Iek=;
        fh=WvinkYcfpQ4UKC6jH3A5dxq/rETVQor9Dmbc5JaDvyw=;
        b=I1yUnimDfcLWV2Wre08/isqIIZmzEdVNy5A2wo6P6UjmZ3OrB8yVakq9NAkj9uZcjG
         LpznlQNT/wGGohkLzjg7UvjqiXkVIEkf/5yjxRIaIQ0Ykcn6c7KIppaaUViha2WDgVwn
         gX05UrTv7Y/DMfCcLyYw7QuDk3qD/vKHOv2Ny4l2ro3r4xQCC/bvGVFacdZyYqfsDYBB
         GX+5vW7F4PP5NJ7zdRxDuRr9x5c0BJz6qRNVYI2rjrdQCkKk15DVW/hsiVb+DH1UecN7
         iKKORGfSTe3PE1vPOhV/O9CNqCQsie5gpyw8lvfGrjI4BkRprQb+aE6eeR9v4B9CF7Gm
         1/3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785487167; x=1786091967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0aS3a1IldF5Hbms4X/oaN6dyR7C27AUylN470557Iek=;
        b=Zm+5p/AY5vlVLVCNQAxGyRVCMoZhwl5WGrfKcHgMxSVizAIeQvdTw0SdY+sT1BX3DW
         TtiVSC65bwNbUOhY5pFU5acHiH59SZFjnktppBihXP4ok4vH2zcguIJQmqhZO13zgCRl
         aiAhh/E+Y728/pwAQRloKZKtb44xH7CUw069iNQqGBGtNCK125F6NbVMseKDorteVwd2
         WpVm7AyhHP29gyLvmbx8rvMuoZlGr4tw56jqW4zLE08uj13f7n5nC16DXZxYhf7AKHd5
         6SKpueDWvgKzRfP3tAx71AAGS3MqRDOCdXNGapwmIHBKcy8iTifzefRwC4wK9KSZHYoN
         HigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785487167; x=1786091967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0aS3a1IldF5Hbms4X/oaN6dyR7C27AUylN470557Iek=;
        b=mXN2/pz8kJEFn+5OV2QsVo/C0SteHlr20nWoIgmsEYCHP4Rs8IwGejeLFEW1Yr8XtE
         JMEo5b5IFexwySX7pyYdv1TrOlgNi8c4ABAeAgs5R5fcf4uDgv8mcWmKj3YmfhvRx4ab
         UiNg0IwuU04QXzSlWldR51dFqkImZzG3Ue35lfKbCYCESt43ALpZ/lv3/oKnIFAIXXBE
         EZ8LAJDvwch+8DZpi5NJiEs9eHg85uflQgwtOfjQ06ObVIKneQ+tr4ZRfLhe5sH7CJCF
         gzhIOWJ2OJVP5LalgtXg9qUbsn0XxZV7Xflmp2wJ4/XfFlkzkmIW8rHG3SPgeQKtlWAf
         BGzw==
X-Forwarded-Encrypted: i=1; AHgh+Ro90Qixs9C3FVKM6gTfEOtdbRtFpmYa36tIioUG2X807ymJhD9chNN68IB/hSwA1NjRn/OEuUR+v8wv6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0J2dkYV4KvtxLeRBk7/wxakyYwoGtyNCDtGsPE34vW4dEgLXi
	Dd/STb2AplYmi9S5VwuYAI7VfsuZU/u9GgghLvj2fTdNc4ttLCFnurr35/JXro8SfsuWz849pPb
	c0lRIC9mM0ufynRyc5RsRHcTcnZMKiKE9a3x8qDXbe3Z+rD9kNJwufHRmZ3LM+T7vSXjLkMgDUo
	+dMMiJIovweSieR5oywdMf1/N4upjWKAsJgLCw1w8N
X-Gm-Gg: AR+sD13nqYKJXfhUxAVof6TUiiSACM3EEKcMdCHRKE29BFFBLl/nYx4bNphUVR64gnG
	QpnPV/j+TYezmW57krvpdNSGiAZtBrQbteKCE8f7BKqlXz/z8b5+eztHkkqLcMzM+pCQaIhXApF
	pAflv145qatk0OEuMStVwQIrBGiiMQio3Tc9F3l0NbpbDSufbMYmGkGzaQ
X-Received: by 2002:a05:690c:7305:b0:81f:650c:98ce with SMTP id 00721157ae682-81fcba86c09mr6967867b3.31.1785487167434;
        Fri, 31 Jul 2026 01:39:27 -0700 (PDT)
X-Received: by 2002:a05:690c:7305:b0:81f:650c:98ce with SMTP id
 00721157ae682-81fcba86c09mr6967197b3.31.1785487167009; Fri, 31 Jul 2026
 01:39:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-10-sumit.garg@kernel.org> <alJpc3nFX9D7_8i1@baldur> <CAGptzHP8EQyvx3tn-ZVWZPN6TwFec-ADvAuxEQhwQBE00Sg=Kw@mail.gmail.com>
In-Reply-To: <CAGptzHP8EQyvx3tn-ZVWZPN6TwFec-ADvAuxEQhwQBE00Sg=Kw@mail.gmail.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 14:09:16 +0530
X-Gm-Features: AUfX_myayjkpJROHbmEgd6_YM-8VOlEVu55qy_zXpmBuYnmJ9VMnESXGGquBttM
Message-ID: <CAGptzHORxaftDtf9K5pCLORK0kpdfP4RGRSE9iNkm0Bf+ZqmGA@mail.gmail.com>
Subject: Re: [PATCH v9 09/14] media: qcom: Switch to generic PAS TZ APIs
To: bod@kernel.org, mchehab@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=I7hVgtgg c=1 sm=1 tr=0 ts=6a6c5f40 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=SwCItUvQPH3YegUC7JoA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MSBTYWx0ZWRfX2ReAhhRStk3j
 TJ+4w4Y4rfppyWqDw1LmocEcbMWC7bsAPo/BeFTj0ZSC5KYac2XgY6C0C2RTZYBZLymQT/tYBBJ
 1YwmSn90Q0OaEpPtrYDV6bF20Hc5X4zzguMCkjnpL8UcM3SBNQWtErWZbSO1t5+kHGtJf4o+H2U
 OtpMMv9a8eBladygV9UGJTontIqjNPZgYzYe4Hch6wGH96MRRo0+cUwZ2+wmdTZCfmU9axSLwUi
 I3k917AGERbsqHLhCqo5NFepXcUMkTuYQFKlHZldI6UeqslOOIoabiL/d30WkQhpo2fyo0C9kgv
 CmgSywTFV2Hr1u1LgCMJmn6wzNlrDbnLtcGxc7gXPfUJk/kiXG0BT8SG/m9AIyPYREsP2nC8EME
 VxKjbyoPtlNFGmNLRI2l70EFpi8Klh6IX+pkS6v4eXpOSgyu2CSbZD92xD0ZQNde7gUoU/UXr5a
 iTK9OE99wNyLoUYSQ6Q==
X-Proofpoint-GUID: vqdW_20KoL1ZfKEEN5MC8HZ11-QUij8r
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MSBTYWx0ZWRfX/VuX5MHB4mTw
 ZYrQLPCnSxwXxgsTCmKAqpbDoT+qire6ydCDLgR9Fo1LGediO+NeDrecdlH/1JMf0GP0voSJPcm
 FNujwb+qcCEIVjoteHfiBpiGJnDB8hw=
X-Proofpoint-ORIG-GUID: vqdW_20KoL1ZfKEEN5MC8HZ11-QUij8r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310061

On Tue, Jul 21, 2026 at 3:53=E2=80=AFPM Sumit Garg <sumit.garg@oss.qualcomm=
.com> wrote:
>
> Hi Bryan, Mauro,
>
> On Sat, Jul 11, 2026 at 9:36=E2=80=AFPM Bjorn Andersson <andersson@kernel=
.org> wrote:
> >
> > On Thu, Jul 02, 2026 at 05:28:25PM +0530, Sumit Garg wrote:
> > > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > >
> > > Switch qcom media client drivers over to generic PAS TZ APIs. Generic=
 PAS
> > > TZ service allows to support multiple TZ implementation backends like=
 QTEE
> > > based SCM PAS service, OP-TEE based PAS service and any further futur=
e TZ
> > > backend service.
> > >
> >
> > Please find an immutable branch with the dependencies for this patch at=
:
> >   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 202607=
02115835.167602-2-sumit.garg@kernel.org
> >
> > Alternatively, if you think there will be no conflicting patches in the
> > time leading up to next merge window provide an Ack and I can pick this
> > through the qcom tree.
>
> Just a gentle reminder for this patch to be picked up as only the Qcom
> media client is left in the next branch for migration to the generic
> PAS layer.
>
> If there aren't any conflicts then please allow Bjorn to pick this
> patch since the cleanup patch dropping the old SCM APIs is blocked on
> this.
>

Gentle reminder again for ack on this patch. We don't want to keep the
legacy SCM APIs just for the media subsystem in v7.3 release.

Can we consider it as a silent ack for Bjorn to pick this patch? This
patch doesn't make any functional changes but it's just about renaming
APIs.

-Sumit

>
> >
> > Thanks,
> > Bjorn
> >
> > > Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > ---
