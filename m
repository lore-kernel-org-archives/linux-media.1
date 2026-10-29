Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793278881;
	b=nsNrfz4LMEKy6wdc25XnNKvasveZhd9oCh8mWT7hNznOeV2RcYfnOwCb1O3gA8rjHXaN
	 EH2VmVHQ0GQu/7qLxpDekCocpXkgIZWEJ9e4kix5PkLwlQMpjU6LHj0WIyU8ivJAWoDoh
	 NBz/kzRamRzfvP74FUrqV28JDvUDWAly8f9JORt+d6O5O4oudQME6v7lV+bLgpUPLGk/C
	 Cg2yxvGXfzNXKDoukLTF1ALxfx+Sz4EzkwY0wXUTVg4MOhH5ODQV4M+mRFSZm0nto5Qda
	 qEffANYWlm6U12y5fj05MGBHVKRJsG4stQ0IDANPgKdo9ce/UgqoNpNVJ876A9Eal0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sCqBj1P3O29v2Iuw4QofabghHgJM2zebox9CahTqtSY=;
	b=MUMLjZZpaAzyVq49uGJzWAQNM7+U7Id0HVSDL+pgQZxgitiwYmNFGgjNQ+Utgl0/EzWQ
	 oB41L8hasG0IrsclHvIJ9xN4++omfURvkV49+EZIKxMxBIo8tOFWUcqSoKFre+weSBE2Z
	 6hrdcTZPXRYBuPKk8Pkykm2cmhmd6EE+zKix0eq76wwBS+l0nD8BTmGgCl5JiiOHxTRz+
	 exTpGXD943Vi9R/jMjY0kwraTMFq0xJnyULcsS5SqPw16r9PBQzXHRMGAtPVxSg6seGw7
	 AHnUwvq1n9lRJz+KRBJZR5zvNAT1WfikEAKp+ajtC0Gr37h1LWZPklx3Pf4T3wGR4OA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ns1FYDU2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CkwGn0z0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18286606A31D
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 13:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18286606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ns1FYDU2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CkwGn0z0
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCdvfC1176883
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 13:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sCqBj1P3O29v2Iuw4QofabghHgJM2zebox9CahTqtSY=; b=ns1FYDU279IfpQgI
	5Xn4h2MdKmuH+/u47439F3pYrN9ZIfaGfINpAuaShNOCWkF4Bc0lRzVXnUlIyHYL
	E2xPmefscZQNq2QupAGPPTw1/XQDMLZQgN00sIkzhP6/cEbKOwFoYwCYCTIwcNfL
	17hidvGCkZFvFOWUF7ZkuhXzVLNW4x3g84gAJIyArxWiz0czk4S4WucifBOn3qZU
	65SZY7arYllhpmon8p1Fh90/PzWxPNUv1QyG/nRo/DRCgbzNFf76+88UV5G6JNPc
	+eYi3U4KNCe+BOtxD+8+jCxgjp8OHbrpwVkpsNbyidoqq0TYmRJgO1GEB0r/WMBQ
	h+bOFQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm4a20gvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 13:01:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb98809caso344878685a.1
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 06:01:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793278879; cv=none;
        d=google.com; s=arc-20260327;
        b=plUO/O1QzTC18mYVm6HqQiKTbYB95ElTT812yS3udW/MXSXvp3mRW84t4Su/fOtYjq
         bJurxe/xH2Iy/MXJ9BLwfecvJN5FJF9SxqJOBtJRQLmyPEoNrWv8O+uWMcC57cAYv0Ci
         mW/wiYODNed4WtDdl1XB07MKKrCOlFBQHYhuHYhaHnZTE8lfUSkQ0Og96DPGh0piVaNx
         +pYEaB77fkdYztncvoqFbN2gqRksIKe7FBtva0Rskvbn4N0WNzQayrgqBJFJd6Wsd+sn
         p8ODE2TImwCfvmm2JeN0+lbCmwfzmOFVbzBCg9b+LuwGBqw3jQQNPA3CzcUZlVO626tT
         6lWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sCqBj1P3O29v2Iuw4QofabghHgJM2zebox9CahTqtSY=;
        fh=vcepUFd/j04xMHdq9DqLt/0qM84iuQ7ekF5irQrHM+g=;
        b=ES7hcDlC/x4y9DwXQiuuGSMB98Wx+6BJ/K2iN8e5cY/+MjdbbzgKTXdGbhje5ehGry
         E2O8mfThjqDYDru97vlsnTniz+Fp5e7xFxN/RHCP5XdW7SjGTEfBJcW1pm//MSRmuZJO
         szoWezNpz4indih6KeNDJ2u74TDjEl37tbiOl/IJGToFUfscMlalyLwepY9eLHPA16xl
         tMT9qtCd3UbrG54x/K9uo69+/wjh+UIn8PaZBR2xDZBLdNvvizfa1E/L+oeZN63IJXdq
         Jls316nsfSnoAlgvJJRUFwV2VeoODJljM93dPTnCLPEG6mHgTrC1qLYi96kkq2rL6Oh0
         vbjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793278879; x=1793883679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sCqBj1P3O29v2Iuw4QofabghHgJM2zebox9CahTqtSY=;
        b=CkwGn0z0gTGQf0rYI3I0ZqNYBhs2le2eBDUjSnYWTxj0RY93vcT4hlucRb/MQJHmmM
         gA7eRJF78LPDo2McYA/TujJrCobCa4KpvbSaXXNvlZ9qpBZoyYdx3lMqM8XV5B0EniHp
         Y2vNn68tu59hZZ1jHoxtzJlodjpS+7EX2qqb/t+3FpOYXhnWgnTjiqKlrAb3e76ahNKm
         DDqznOPfcPmI2OUnn4G0WhUa0YwYhAuGMekr7iCiOTyc457J7wm2SP14bf4puEM3WWHV
         iIaMpZNhpairsMyyzXRoSpYixjI0bSdL5ag7OWYKrhk0Vl2uvjrSfgesb0+2jtKuoZKD
         oYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278879; x=1793883679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCqBj1P3O29v2Iuw4QofabghHgJM2zebox9CahTqtSY=;
        b=UNCG/8GAHI00VcurSV7cPkiydGgZis73hMULhYV7nhtjBZBrQCPWbTELlojPKi69uZ
         zs/eP5ZUxP4QjcYtd2LHsuPwLsM1tSJNfsEQU26poeYfF/bf0ArN0ngxFejhLxt+liJr
         2tZ2Ec5i0SB+70PlI2gpPGXOFIspEaT2WA4Bug4u8WI15bFIDUDMYE/zdWsWPVfl3HIG
         5xYL9Qa1RV6KMtzlwZtrQ5t48aWVZbhjFOMsHKZbP/mbH8Y7RgXLIDVkl6UXErHe6jki
         WffBzrFCgckBETSEf23X7AswIcgLmgPuQSoKAdGU8TLCWzpMtQOzBqVtIA3KtRufwOBP
         mnuw==
X-Gm-Message-State: AFq9FYLbJrmI+ZpmhlD9dX6CYPe0zg7TK/K+cWfI1uH3f4DlQKGN7nE7
	Ov7zGxLVvdK4kUxrdqfbd79JbokdXnkNxz81n/Y3lH1lj0h3pxmX4FY7oa5lLw9Ux5840mY2gDr
	FrhHIMOVyZbarmSLja+Kn76W7pNPMU4OAZGujIRBOXedVvg1cvDQBtuXWfCXZF4XVSw4QAPYEz/
	FbC+AP/S3CAFs6Z0xr485qaqMMnjQ/gavNrNTxmagAlOXyc55mSS9VBA==
X-Gm-Gg: AYBFou33vlpXmSSZUmKeZhwIam68hsXOtkItSfoyQSxEGzA4pLNLj2IcLSTm4Cki4lC
	qIlR7ftlF2/i9yt/TOyvx34nOHfBDrQpLpwE8qo+dVCOmtGFiVXbIzozQJwYYWJZ9Rg6jhfeock
	mthWCzdhSj8GxmNqYe4L0TWejJcmoz6g2t2rPw/mn1yN06CC7jIw94vJhHS4cJDjAybu01FR5gi
	GGidyuEXrmDz+eckkP9TY3IsV8A9/fN2eQLDp1Gm233+hv3K4N+ZEmyXJ/EH79wM5u6q9N8+1B9
X-Received: by 2002:a05:620a:1725:b0:93e:fb96:68f5 with SMTP id af79cd13be357-94408a8c3b1mr790978785a.32.1793278878909;
        Thu, 29 Oct 2026 06:01:18 -0700 (PDT)
X-Received: by 2002:a05:620a:1725:b0:93e:fb96:68f5 with SMTP id
 af79cd13be357-94408a8c3b1mr790970785a.32.1793278878266; Thu, 29 Oct 2026
 06:01:18 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029123107.28705-1-xiaqinghuan@mail.ustc.edu.cn> <20261029123107.28705-3-xiaqinghuan@mail.ustc.edu.cn>
In-Reply-To: <20261029123107.28705-3-xiaqinghuan@mail.ustc.edu.cn>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:01:07 +0100
X-Gm-Features: AclHuK9HHjKdAV_87O7vafl7ryiBF0S_hg2q2SY-cNvI08xHiOvoE__qojfybps
Message-ID: <CAFEp6-0sLQfiNP8e+3+ZEXnjPG4GzJSPtiyEGfG2tXt-DuptGw@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: camss: video: check that a buffer is DMA
 contiguous and add a prepare hook
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MCBTYWx0ZWRfX6gI7K8j2DV/H
 7NDJ9wEsuF+IaGZgipILg5QDXQpFIWHCk7zwos4UwHaTENikQgqzWJA+Quk6No1fUlom+xsAkly
 QG5QOQyOTnQ/1dc5OLp+uyDRCL6nlp9fQ5BctbXYuZ9PLOzjI/FgMuTWlzwKL5VYpe98HTK58AV
 Y5M0jMhJqhRwJRvFDn9XPuK4BrejcrOrHHMomQ2rBh9tIDXpdnW9etOo+IbE0pOQvotqcSBqfYA
 9P0WQdFZcRqvMSZFFYUfpyKY2sywR/stKV8q7T6qblrGfUkma30JFwy/O64oFlHNOkdHz8Bj4vK
 zWi2GOzIm0NSsnyaLf1tSG7e+2vtHSla82KRmMTvbSTKOJRlYoV9HB5Dak/Er692Usv1vXs0VZO
 oj9Wyw1SgJd0e/vAiZfRXXcWQLM3gMLHtK/fyg5eoyp1p9uA0iNP6ctWs0b58o4jL/xxV/jV8c6
 6LEKlofRUia4rXDcc7g==
X-Authority-Analysis: v=2.4 cv=E8tYNqdl c=1 sm=1 tr=0 ts=6ae343a0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=5jp7TkJpA6SZ9Z3lt2IA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MCBTYWx0ZWRfXy3rbjMSDt8ag
 M2yJWJysOsJcmgrjBPHTF25n6UXxj8PGlKEvbiDhvAktHRwKxSUTbTQeBP+sEtJZgGzc5KilDfA
 BmLWKUzWYUYhYnH7mbq0frsc5CsCYqc=
X-Proofpoint-ORIG-GUID: hqqs42Kc4fFJmt1kKfqY72H5V7067DYp
X-Proofpoint-GUID: hqqs42Kc4fFJmt1kKfqY72H5V7067DYp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290050

On Thu, Oct 29, 2026 at 1:31=E2=80=AFPM Qianhui Xu <xiaqinghuan@mail.ustc.e=
du.cn> wrote:
>
> The write master of the newer VFE generations can only be programmed with
> a buffer whose payload is physically contiguous, because the frame
> increment registers describe one linear address range.  Check that the DM=
A
> mapping of every plane is contiguous for at least sizeimage bytes and
> reject the buffer otherwise, instead of silently writing past the end of
> the first scatterlist entry.

Have you tested the non-contiguous case? It=E2=80=99s a bit surprising to m=
e,
since the device-visible IOVA is still contiguous.

Perhaps this is related to frame subsampling, in which case the frame
buffers themselves would need to remain contiguous to take advantage
of the hardware frame-increment mechanism. But even then, the relevant
address space from the hardware's perspective should still be the
IOVA.

Regards,
Loic

>
> Also let the SoC code add its own alignment requirements to a queued
> buffer through a new prepare_buffer() video operation, which runs after
> the generic checks.
>
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  .../media/platform/qcom/camss/camss-video.c    | 18 +++++++++++++++++-
>  .../media/platform/qcom/camss/camss-video.h    |  1 +
>  2 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index 0852eb6f13..027cf024f9 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -155,7 +155,10 @@ static int video_buf_init(struct vb2_buffer *vb)
>         const struct v4l2_pix_format_mplane *format =3D
>                                                 &video->active_fmt.fmt.pi=
x_mp;
>         struct sg_table *sgt;
> -       unsigned int i;
> +       struct scatterlist *sg;
> +       dma_addr_t end;
> +       unsigned int i, j;
> +       size_t contiguous;
>
>         for (i =3D 0; i < format->num_planes; i++) {
>                 sgt =3D vb2_dma_sg_plane_desc(vb, i);
> @@ -163,6 +166,16 @@ static int video_buf_init(struct vb2_buffer *vb)
>                         return -EFAULT;
>
>                 buffer->addr[i] =3D sg_dma_address(sgt->sgl);
> +               end =3D buffer->addr[i];
> +               contiguous =3D 0;
> +               for_each_sgtable_dma_sg(sgt, sg, j) {
> +                       if (sg_dma_address(sg) !=3D end)
> +                               break;
> +                       contiguous +=3D sg_dma_len(sg);
> +                       end +=3D sg_dma_len(sg);
> +               }
> +               if (contiguous < format->plane_fmt[i].sizeimage)
> +                       return -EINVAL;
>         }
>
>         if (format->pixelformat =3D=3D V4L2_PIX_FMT_NV12 ||
> @@ -193,6 +206,9 @@ static int video_buf_prepare(struct vb2_buffer *vb)
>
>         vbuf->field =3D V4L2_FIELD_NONE;
>
> +       if (video->ops->prepare_buffer)
> +               return video->ops->prepare_buffer(video, vb);
> +
>         return 0;
>  }
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.h b/drivers/me=
dia/platform/qcom/camss/camss-video.h
> index d3e56e240a..af046ecb7f 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.h
> +++ b/drivers/media/platform/qcom/camss/camss-video.h
> @@ -28,6 +28,7 @@ struct camss_buffer {
>  struct camss_video;
>
>  struct camss_video_ops {
> +       int (*prepare_buffer)(struct camss_video *vid, struct vb2_buffer =
*vb);
>         int (*queue_buffer)(struct camss_video *vid, struct camss_buffer =
*buf);
>         int (*flush_buffers)(struct camss_video *vid,
>                              enum vb2_buffer_state state);
>
