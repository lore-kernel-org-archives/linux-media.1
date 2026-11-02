Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793631318;
	b=DPUYlYgrGtINin0whrFz9wx+LqlKlESKjR7RktNme2RBsadL6WUQJEL5FNO8RrcePjDD
	 BJSOMv+hHYImrrelnMG3+YSPF4bMKYmLxe+AXQ11n8ZziETpxMz/JtrerPhJa/PV1X83C
	 tMmk2ut5outaIb/dp8mIG9FYtfyJkHWt3RfK8sF0JhjLXE4VvaM04hBNY5lT7u8pH/yGs
	 a7nUFBeaqbF2x25NS0jX4EsvuwWElKcLU0UlKGopDfm/rW3n0HMf8WBp2JUTXAse/GDkL
	 JIo7O1KlFGf5AFG/U/Ln43KVYSzzM42lPR/mMpG7hxgQPujP5OnlLJzsehny/DFxbbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631318;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Oy537ZWjKxyQhEB86KvZocPds1AfNsAqi07sU3ki/9A=;
	b=iNGMUtjBIExKjr0+mYzzZKKX9uTimy2+e2f8+okVKb9RIKvAfkMKfpUncOL6WnZdVUGw
	 s41MdrMp0gRrWMECmEwQv9yiGPpP/LfMSaLxieYEsP/jAq8itZhFMP99EV/+uXcFqW/6C
	 erWPUnKHwp8uzJ0rSHOt05ueHHeyV4P2NAspfXKKpZxNQxKIpykmKCkxLNWnXZ3qMa+Q/
	 tv34Qj3Nme8Nu25A72Z7eDhMWb4Y3anzYgZcaMVUjRSEHdxabVyj+ArodWzdt6IDiE3Rc
	 WA6bGnaawWvYdCf3AFUuIVNxedDCuqhLA3OBswAPQnivMnhSeq4RQ0LTmSXkhcedjAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mjiWjOLd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EkH6xV6N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D312C606E030
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 14:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D312C606E030
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mjiWjOLd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EkH6xV6N
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpLxp3102602
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 14:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oy537ZWjKxyQhEB86KvZocPds1AfNsAqi07sU3ki/9A=; b=mjiWjOLdqgJzvvTI
	sTYSKgl/P7FHPZgCO767uXHR48wyo7XlfIg+dvnYmQd/smRMftkFN7yC+TrNamEH
	SqBdfEnruGd8uUaMtKbypytcjUzYXG2K8WfsFxQtXFrhYCEl5bqfjTl+5oxQ+794
	bP2nD5KkTTYzSZxcYoekfzJXi1avbIiwhpX6ZXnMn4hMnhMfoU0ozQUT84XsPZeR
	CKAitaqh+yn8UOZBstVLOyV+AlYVy5MYDqqHYBJJtqeam0cxiCFkpyHuVu3QpDRx
	bJhGOHNkrRVejfL8bQu7GsTHKFFdrsEscLvTsHw3EF94b8TpoiXEeAHPXiD5XJGy
	LPtmtQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rjbvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 14:55:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so621877285a.2
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 06:55:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793631316; cv=none;
        d=google.com; s=arc-20260327;
        b=mxPqv3l/rDVYvpBBTLgGzpgbl0Isdt7o0pUTEaOk+Q9edV+pwP2MvPqCeTYhVu3TzE
         gXDalJR0pOfV+3WUKiyuC3ahBqBnYp8Iqt8e8KcJfyUHuXXGn4m9neIfr96bOkLptqiT
         TP1RHC20ytkoqMFVJtz1OYE+8A65IM0e0OBxp2G8jqANKQOrsiyHZ4Zd6jCR/KJowg2X
         ozksAMyKlPKONdvFIME0nA33AjRhGNTT1+D3SKMgrFbl0I6XnN0GsUTLubWMM3HdKHEU
         wvdRaoiYPqkzF8tvbXSq5p+Ei2u1R6agIFzPdT+70v9h8oQIqvkD7WcEIdoHMqCO98Nh
         4FbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Oy537ZWjKxyQhEB86KvZocPds1AfNsAqi07sU3ki/9A=;
        fh=D8rdp1NKlBgsmXDgJ1IP1hm08cCZK1Wr5lT+K92y7xs=;
        b=NH0IljGZ0fQcpkxNh2+aOmAdk+iBBB98PRshlqLczMRpk5yg5eVWjHPHLrudDecmPC
         UyRyVsMBtPTNCBbK4B4HYBt6hAcmT1pQ3+b+76bCG0nTQYxZgaccwjXaOHotEs6sKfmC
         unkbKYBcYLdf4J//2tbOGcu/9IeUl5i2HDNlcr0z/Edh1Sjp0fO3bjDtakRv8AX5a/F+
         n/RhBPqCqKN1EDSMcO8Gg6QeRgYLSPURU/zwGqoAx+t9miHoBj9wUf6Qhoz4xN/8RpoB
         FBaV5q7c6i7k0tVtl8l1MdpwCYrAnh9NNrejqIN1ruLPJERU5zw/IsI56LcGP5J0eDHc
         cauw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793631316; x=1794236116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oy537ZWjKxyQhEB86KvZocPds1AfNsAqi07sU3ki/9A=;
        b=EkH6xV6NsHfq39FbdgS1t61EBukHOxQCap0Z1EAZajhlT71dxHeeFeyLEeQ7PEzfMV
         CF/uUwKtRtHCxTE9AFXfvNnohJyQ5z9PdM4Vtpl1OZx8+0WO13TSGTILTjNlzb+BlgL1
         fI835XMMTV6Fk4LjRiS1ArM+Cl+a72bjYV4SC/7VxeRgHQZLb5sYXAhJ1NHDa032w2Jn
         zYtdsU0ApoLzCo+9vYBozYGdJ9x+qJMEts+thHSHj6k+ZXP3R4B1o24PMbJU+RjUp3mW
         kUJkTbDiUujJGxv1jLT1GZZITDRgGU/tudpQubYLGug0daogwFtnsg2ygY+oevNOwnqi
         1wzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631316; x=1794236116;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oy537ZWjKxyQhEB86KvZocPds1AfNsAqi07sU3ki/9A=;
        b=BiJP6TmoCLO1JpHr1pC6wAEpU6MGmSeM1YY3jQCzcnqSfvGhKbzrP9RJfGMVnlUFh9
         e+AVzM+j9li2dmoRtBgFgUYst5XW16Y2vi4NFeytwM/FkOkGmPJxlK6ozPJd5cg/Cn9+
         xurMue4hfPStJgWNJemBCuSEF+TFitr6t+XqiMqGcpO4sqoveIsZXorm4rx1yFSkXrrn
         0F3bCsGidLgeMCxRWeIXHI5WFKvnBE/SnqcBpzT3XW+HbVn0LfPmDtX2Q/221x0HgUuC
         uAumJob2ieezCFzraKmleiT28NfWU4xlOhnk5HaP3tz5MKsHOK0AfZNObzbqxEf5aCtm
         pFLA==
X-Forwarded-Encrypted: i=1; AKwUvBy2kzSVcaAdtdigmatIdVEDzYURpfkbnM5KMUlQuVPUlFbGxLe/kPInSrnKO/IdHBmlmpqiJDWOcO5Gaw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKjS2Q4bQTxilE9i9ToTktD/5csp4uIFQJRcOJEQso4q6Iw2gr3
	hnryDEIJN8HPVxOfdhgufaeZRiuKwPZ2Y/+5UcVNnEQ4bT2weiqQw8ImBchTU0WAhRbGGGB/NsE
	KPcFAl/Njxzrc34iPIq1ucMIeuoetihtwSHsvTEirJ/H2jJG0XAd2/IDElAnIEBA1zJDgLrUTBz
	rZvTmYgctVML5+0V3XrfECEcw0gwQWEtz1hxmNfH6I
X-Gm-Gg: AYBFou3/MVuf090j4Bqop+Ot6JgQDjyRiPZ14qycBRHZHeK9zB+1/oeBbB5j4LQ+1hE
	257tiz/Sj14gT7+Nmmd2BPJccU0aBDKVhMfTsfbD/uxPpRRbUMGOkj//6oPYnCVzq1QCzNTh696
	IhTJr/WopkRCvaxnCbxw6ZxlRSPpv7enEvaCSDvcXDATJOyfm1hfSOJDIR4kvNdnwqOESMDT9VD
	YznUJenrw4JFsi9fXXMHaUZwmON1XJzqu4iWKrnAGDfSlO+XfzNYw3vPBTRuOL1ru5hbdzbTks=
X-Received: by 2002:a05:620a:319e:b0:93e:c12c:f12f with SMTP id af79cd13be357-944217fe8ebmr1649071685a.74.1793631315766;
        Mon, 02 Nov 2026 06:55:15 -0800 (PST)
X-Received: by 2002:a05:620a:319e:b0:93e:c12c:f12f with SMTP id
 af79cd13be357-944217fe8ebmr1649066785a.74.1793631315185; Mon, 02 Nov 2026
 06:55:15 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org> <20261102-v4l2-frame-sync-v2-3-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-3-25cbed7a772f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:55:03 +0100
X-Gm-Features: AclHuK8uFpGqrSlwL_Gla-8nt7_yo10ghy7RgxQA3de9eH4udglYpVnEJ8mIXEI
Message-ID: <CAFEp6-0Gu_Exs9mQnDvBP0BSNcwdRak56PxFHJwfponbGoFxTA@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] media: qcom: camss: Use SOF sequence tracking for vb.sequence
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: DCT2xDl1LQH138SCnmBPJuh2-ahVv3eV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX5yOs7B1PODw+
 VKL6/xc+socTAysiR1n3WU0Y49AvehxOmegAGv1vlSxiLaaFIH7wXKzd9MtOxCMT2CsUaX2eEU3
 c8BrtnKOtI/5egQR+Lh9c30Ml5g34cc+CPKPpSC1Vxtu74PvigLOvV3yfBJ5fM0xFm2DwWv857E
 a4vs45YtTcZ0U1pGcRIuc7MpLRkrPRWWFwBkrIfXEPVdla7k2eJz4uH5/4jtdPHxRnlVYtPRoib
 8fs25ZXnUaR92NbuFAqfKo8vihh9FgMdl4cB+XAktPzQpjHHYKx+yjSxp8dvEulkSqITCbvZuUX
 wyjDP4HWw3DeJgeC8jN5bGZ/NxJfk24dAOJ+WUkOWD7lWou1nAkwOFiWXE6TXwHlxTKnFm2+IeM
 9tXaKFS+gUqpotw3Dj79LGd9Ge7aA5sAxF/xO+lMzV5oHjQLcW5YFbvjO1m6xWphVVGHzeGjrov
 44J/BZMawIZazyxlYSg==
X-Proofpoint-GUID: DCT2xDl1LQH138SCnmBPJuh2-ahVv3eV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX8TmTX0u/AxRc
 WE5XVK9J5HhJHA4VTpqGqU+7TdJty2aoOL3uakpPEH/Zse6poQw1WfcRo+JqgpMRH3qdysBXIn1
 3nrn37AKLJ+m+dnnFnIr72PtTdgbvTs=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae8a455 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=uhjY8jlQ0jKR33dU9vQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020059

On Mon, Nov 2, 2026 at 2:57=E2=80=AFPM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> We want to correlate statistics buffers with data-buffers. To do that we
> will need to have a sequence number driven by the SOF signal.
>
> Rather than incrementing vb.sequence when data arrives, we should increme=
nt
> when SOF happens.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csid.c    | 14 ++++++++++++++
>  drivers/media/platform/qcom/camss/camss-csid.h    |  9 +++++++++
>  drivers/media/platform/qcom/camss/camss-vfe-17x.c |  5 ++++-
>  drivers/media/platform/qcom/camss/camss-vfe.c     |  9 ++++++++-
>  drivers/media/platform/qcom/camss/camss-vfe.h     |  1 +
>  5 files changed, 36 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
> index e9b399fcb9c7a..4f4ed4fa46aac 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1355,6 +1355,20 @@ static int csid_subscribe_event(struct v4l2_subdev=
 *sd, struct v4l2_fh *fh,
>         return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
>  }
>
> +atomic_t *csid_get_sof_seq(struct media_pad *pad)
> +{
> +       struct csid_device *csid;
> +
> +       if (!pad || pad->index < MSM_CSID_PAD_FIRST_SRC)
> +               return NULL;
> +
> +       csid =3D v4l2_get_subdevdata(media_entity_to_v4l2_subdev(pad->ent=
ity));
> +       if (!csid->res->frame_sync_en)
> +               return NULL;
> +
> +       return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
> +}
> +
>  void csid_sof_event(struct csid_device *csid, unsigned int id)
>  {
>         struct v4l2_event event =3D {
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/med=
ia/platform/qcom/camss/camss-csid.h
> index 2e48b08b93592..f3199579e3442 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -260,4 +260,13 @@ u32 csid_src_pad_code(struct csid_device *csid, u32 =
sink_code,
>   */
>  void csid_sof_event(struct csid_device *csid, unsigned int id);
>
> +/*
> + * csid_get_sof_seq - Get a pointer to the SOF frame sequence variable.
> + * @pad: Remote pad of a consumer's sink pad
> + *
> + * Return the counter or NULL if @pad isn't a CSID or the CSID doesn't s=
upport
> + * SOF tracking.
> + */
> +atomic_t *csid_get_sof_seq(struct media_pad *pad);
> +
>  #endif /* QC_MSM_CAMSS_CSID_H */
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/=
media/platform/qcom/camss/camss-vfe-17x.c
> index 62c2405359a06..4972d3ab65078 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> @@ -491,7 +491,10 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, =
u8 wm)
>         }
>
>         ready_buf->vb.vb2_buf.timestamp =3D ts;
> -       ready_buf->vb.sequence =3D output->sequence++;
> +       if (line->sof_seq)
> +               ready_buf->vb.sequence =3D atomic_read(line->sof_seq);
> +       else
> +               ready_buf->vb.sequence =3D output->sequence++;
>
>         index =3D 0;
>         output->buf[0] =3D output->buf[1];
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765f..da373024c847e 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -474,7 +474,10 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
>         }
>
>         ready_buf->vb.vb2_buf.timestamp =3D ts;
> -       ready_buf->vb.sequence =3D output->sequence++;
> +       if (line->sof_seq)
> +               ready_buf->vb.sequence =3D atomic_read(line->sof_seq);
> +       else
> +               ready_buf->vb.sequence =3D output->sequence++;
>
>         index =3D 0;
>         output->buf[0] =3D output->buf[1];
> @@ -508,6 +511,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
>         struct vfe_output *output =3D &line->output;
>         const struct vfe_hw_ops *ops =3D vfe->res->hw_ops;
>         struct media_pad *sensor_pad;
> +       struct media_pad *csid_pad;
>         unsigned long flags;
>         unsigned int frame_skip =3D 0;
>         unsigned int i;
> @@ -523,6 +527,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
>                         frame_skip =3D VFE_FRAME_DROP_VAL - 1;
>         }
>
> +       csid_pad =3D media_pad_remote_pad_first(&line->pads[MSM_VFE_PAD_S=
INK]);
> +       line->sof_seq =3D csid_get_sof_seq(csid_pad);
> +
>         spin_lock_irqsave(&vfe->output_lock, flags);
>
>         ops->reg_update_clear(vfe, line->id);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/medi=
a/platform/qcom/camss/camss-vfe.h
> index ae9dad353a378..0e2dfa58421ad 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -94,6 +94,7 @@ struct vfe_line {
>         struct vfe_output output;
>         const struct camss_format_info *formats;
>         unsigned int nformats;
> +       atomic_t *sof_seq;
>  };
>
>  struct vfe_device;
>
> --
> 2.56.0
>
