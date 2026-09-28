Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A525346D2AF
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582139; cv=pass; b=iKKB6hPLc849+W48pe92ZXC8bGw8KFCrzyK7bmM1IkQ0leD7P/jhntPgOHviXnNotAY1wbmrfoCR3XnRn20KdWDOScCDtYw4h7FvIplL9AYAgHbm5wmioS9eZFvRTC+x/BMARGr+HITAn+YxXJOow141XTgRvDCljQQEHG67bw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582139; c=relaxed/simple;
	bh=UuW35MBetpwb1g3X+//n/9JYo+liVtpSrqvfGQ3Z07I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LMpLO0x4VIs/24sLXU7Xz11tsTyCXCOUKEQxItidB+df/Nx7BqX2HClN0J9qcDZJQn2H8bof/nIGTOkuqqnskS9FVoSj3xE1ukLmsa4xC7sp4PBmYEfbqfHAMRNNwH+m00QMrmTCv9/YB7MYXEu4VlKyG/AXEBmfIGnzfF/deXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0peEhYk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/uhY1fd; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0peEhYk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b/uhY1fd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S74ugO718590
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TTNiXfyvPaAwMHsslS5POvu5n35IM7ktoXHv5WJO9sE=; b=G0peEhYk0QmYK2Ue
	5puv6C7j3KK7DGvW/TydgqUiMt0lZ8pg3e8dmIyTZnv0YiVCBcV0t40EqChxrXyL
	O7l7uMrtS3whu7raqcVGxBKiqmGI6qsAyAh59nwLifAiLirSoNE/hQzv3zhFIIdO
	Du+vXbgcXKTBSmaFjM3yMAi6JzbWQGnpffOhRTLYJ1lWBMSPsgXR2oMJWoZRDBeA
	R6DyChEL141+gwRtR4T+r6TP4oKbU59UkK1X1j+C6XUU0N1VA0GY6IeE0q4TIbVQ
	KphuqqOHkBrgWEkMtcci/UMnxMG9PDpDQ68ieiGxs7TxfM7emOo3wOPSym4xRM3w
	FSKvLg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx526n6se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:55:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ae8e7e546so569700485a.1
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 00:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790582136; cv=none;
        d=google.com; s=arc-20260327;
        b=b6bTI2EvLIIQWrOOAd1pnOLAijigVrdFrB2GJFsMLn1i1uVjSwXe7GdYVN7dcRGm37
         2SIzdIK4xgENtVjiMlILeIPO0DdmvZr1P2FiAW3ij/XEbj5lDXChCo4p2Uaj3K+lZLDg
         dHQ2JozfZqmBOfxSaYfUHRoDJARYcJ8KkkG1RVFhH+ub7SYFUdWuKxo0hESE3NsBXKIs
         kED7uQekEWREvGE9wLxDItsjrVlfUmDKscsoU3vMCx9+Tq1oUWvPSNE+vZK7CXg/RC+M
         qjyYYD1aBTjHn2rCLKc9TzxEasdUFFPH59WqKGQv0+6BiubLFSatowdKv1V7gWcqV5SP
         36VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TTNiXfyvPaAwMHsslS5POvu5n35IM7ktoXHv5WJO9sE=;
        fh=tdUDemX6FQnR6Wxcy8Grnsi00dw5T2f23Wd5o9HPPuA=;
        b=sefR2aPtpNSkUJyBDv1p6ie7lwRnO9CW+ANfxz9hm2/oRnh7zlqY2ttwn4Q2mgyuLJ
         3rAxEqG7hYGWkU5z5f7TO4FNMnMQmeO1oheWUhm+HiIwHdwQI1Ha3L95MN1ZdY0bpGP/
         4fN+5e146K5yVv0sIdPORakG7d1x5oPcDQfa7+DDacVyW5bTwVjFuGs7Sfkd5F76KKlf
         dTuWkI6KLcyrtCzRO8R1cD6lgGsYhVHYMTpM242lCew7ZdvVRNn37eLjlJsjnESB5FKv
         Q6tHzxPq7szFSQKkdQZ/9W+cRHRMTzy4wOaWP/BUTiuqv8kF7B+HvjXIOr15Sp4Q8k3x
         y0DA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790582136; x=1791186936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TTNiXfyvPaAwMHsslS5POvu5n35IM7ktoXHv5WJO9sE=;
        b=b/uhY1fd2nKnFVrwPMWldzMmENf82vQ1t0Leufi1lAL1tkEdvzSCTZHC9I16t3tpcZ
         zvQapNevGBsH4QmgQCANizqPYKAQR8JCCgRJlV1KuucH/rckznjanAPblHA62+CMcZnw
         kx+L+VXUoVfXEpp6skYh27bVVHTTxa0nbI53ZVl3Fa3ZLlzLraPggDKlMs/zV1NRuqoS
         LL+64QCu40BBvPw9xxvEjWnwD5OdAfp5M6TaJq20OnpWWPRWF5oBLGjw1+e4xtLwa9LU
         ImGmVNYIodM3i/5X2YpwABneW9McfHT1GSE3Hj7aNjA1NU3ftrxdgyK/ch/2MtYshKPH
         TUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582136; x=1791186936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TTNiXfyvPaAwMHsslS5POvu5n35IM7ktoXHv5WJO9sE=;
        b=LhBXbdrT1s7szjdjR50CTj0y+SXyTacWLapo/QW4tC9b5wGjV1WIh0Mpi2E0xdsiv+
         EUfXd0E39hVKjroJnkSL5E/4PWWlBPQpyiVl2yUzLfRjQ4h5d1U37lcTduH86OXk5ZUJ
         cLZSRG0nVaj+M1zHFzKPfnTH26/F7BHogwSFt5YGxQ8z4Fxt19puOYlTj7G+9R4f0AIj
         N3Ru6eaI4+4SO9X47Sn/T8EeCi3/ofxyRUzVebdFIi0HM0dvyJ2fU6KwtFD3MygQiMf8
         XGI2vJ9vXcqJ5Wq9N0sJMChyVW2bvwwiA9LFRXt2m3Qm0u3jqEzZymopVAQEomFGHNhj
         f5qA==
X-Gm-Message-State: AFuF++mLBEYT/BQqnERak5UN2jb79rkC8Z+h8WC41J9GvKNPP1hFiJNP
	RmWlO8KQor5vTdlEwrWpiLz47r9bSYlh2+gdn2tuIoPp+GWi3lECUmxWAybGTVK9Qfr4HdXO5/f
	O4AwgEMRoLUXAzjzeztZjVcetfqB+yvgM1tWtwtN/N11ZkMvKahiwYMOeBGzgWS0FqT45ZQsrL/
	o6d5lUUDSS0wKe30g3YDJjmPWdxHsek90pchVcV/7I
X-Gm-Gg: AYBFou1udankZLXqnq9tnuVBucrkhd7t7655EEbf0SoZF8gAafff+nnxl7IwXmlXrrR
	a8FaRmQ6i/Y9HXS8Dv9tbJhKU6FJ0U7zEH7wXBa0wS4SD0+1GKSyCwSQb4u1FmIgnMogQ4muZrY
	E/TS0654cLKX37fr1kKy303rVA3tkidq6GU3zxoPfeUN3iw2KWNGr0HmTUeCnEhqFIgj/7NkTYo
	NSkxN6/ZuxNFyqX0pD39ne8JL7t/A2geSg1PFCJe0M2JcAz5NzjCR2nY3f5NZgsDL1A++TD/4k=
X-Received: by 2002:a05:620a:8810:b0:939:c303:c54a with SMTP id af79cd13be357-93c43c9db58mr1958675985a.31.1790582135633;
        Mon, 28 Sep 2026 00:55:35 -0700 (PDT)
X-Received: by 2002:a05:620a:8810:b0:939:c303:c54a with SMTP id
 af79cd13be357-93c43c9db58mr1958674285a.31.1790582135196; Mon, 28 Sep 2026
 00:55:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928064336.272659-1-hitesh@ebytelogic.com> <20260928064336.272659-4-hitesh@ebytelogic.com>
In-Reply-To: <20260928064336.272659-4-hitesh@ebytelogic.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 09:55:24 +0200
X-Gm-Features: AclHuK_oGCJSjSnsJjbXR3zmNY9Fqnx0g8gO4MkrHkFwsN1N6iEzDouVu-By03U
Message-ID: <CAFEp6-0F-0E2OAQXVbW5fk5bPyBJH-sxWax2vDUouCCe6RQzeg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] media: qcom: camss: vfe: Fix VFE reset while
 another line is streaming
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: linux-media@vger.kernel.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ravi@ebytelogic.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=VvS2kO2n c=1 sm=1 tr=0 ts=6aba1d78 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=ZovgdgjKAAAA:8 a=lF_edr8HrfaS-bhVEKgA:9
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-GUID: tNCR2jtT0EAwIRu40NpKGAnnND4lrFr5
X-Proofpoint-ORIG-GUID: tNCR2jtT0EAwIRu40NpKGAnnND4lrFr5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfX9UwL/RXzUr3z
 nnmbF0ZLprCOf2zeVTHaSI7sp3XuTqN9tX0fiRHL1OyLtYscmYB4Rwt2+oXiF1Iu/NLu8wo9eP3
 SI7zWHdtnCFRNpJHhcHPUPH60/8b/VYlpK6z37aM73lb0ISXeJ7cZRzkll1llAN2jg6nZB46iNb
 AUQ5/bUCGgyyPuwaSjNts9HOUYCKmE+V0y01veVhPcgsIKezMjUfUdkSjTrd4Ps48uO+wlej9sD
 JR4WBMaP0We6sYE+HleS23UXGStEVbxJPkH7ruAqgi61zSdDvE+Ma3AEX8qlBtEqYou6zYGavd5
 fv/lhA+1mEhQaEKSj6/mbjrKkg7GqDSLqLMKTWbi0/CasaWX5gw+9gLLQPSl9A+bhE0Y1CSgVGM
 2o9wsbnOVnKvB8wwqEVtKAD9oKlhPxByv4be6bc598G+A974Mj8Ts6GqJlaeEAD6vCSLxoItc4s
 VJwYFDpGycuTk4pmFAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfX0zNSddXtpW6y
 9pynNuWMG/PNmsSjkTm0lVSgsGrXb4dnzpLARzwZo3sg/as+UNse6bgHb6UvfadyRfYJxFAQ68L
 z5CG4FJruf+BU+lFnY3/r/j3htRJEeg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280031

On Mon, Sep 28, 2026 at 8:43=E2=80=AFAM Hitesh Patel <hitesh@ebytelogic.com=
> wrote:
>
> vfe_disable_output() stops the write masters of the line being
> disabled and then resets the whole VFE. The reset is not limited to
> that line.
>
> When two lines of one VFE stream at the same time, which is the case
> whenever a CSID demultiplexes several virtual channels to different
> RDIs, stopping the first line resets the VFE underneath the second
> line. The second line's write master configuration is wiped, the
> buffers it had in flight are never completed, and the VFE is left in
> a state in which the next global reset is not acknowledged. Stopping
> or restarting the second line then fails with:
>
>   VFE reset timeout
>
> Only reset the VFE when the line being disabled is the last one
> streaming, which vfe->stream_count already tracks. Stopping the
> line's write masters is enough to quiesce that line on its own. With
> a single line streaming, the reset happens exactly as before.
>
> Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version =
Titan 170")
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index c14d97a131..3442dacc80 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -814,6 +814,7 @@ static int vfe_disable_output(struct vfe_line *line)
>         struct vfe_output *output =3D &line->output;
>         unsigned long flags;
>         unsigned int i;
> +       bool last;
>
>         spin_lock_irqsave(&vfe->output_lock, flags);
>         for (i =3D 0; i < output->wm_num; i++)
> @@ -821,6 +822,13 @@ static int vfe_disable_output(struct vfe_line *line)
>         output->gen2.active_num =3D 0;
>         spin_unlock_irqrestore(&vfe->output_lock, flags);
>
> +       mutex_lock(&vfe->stream_lock);
> +       last =3D vfe->stream_count =3D=3D 1;
> +       mutex_unlock(&vfe->stream_lock);
> +
> +       if (!last)
> +               return 0;

Instead I would move the vfe_reset() into vfe_disable().

> +
>         return vfe_reset(vfe);
>  }
>
> --
> 2.43.0
>
