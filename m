Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D833769FE
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790581503; cv=pass; b=lCXKsdDDm2RQCkVI2LlR9QsTrw1nKogJalgd8c7d9KnGlKO99ld05ss0R+LyPlS+Gg83t6BAubhIVqqIH2R5SCMaklyjmQXktvZey+y4afXW9/qbMS7i+H5iPm02zF9V35ri2566Gz2EpVgx4eIn5kOP8H+1duZ2+iOL8+wZtQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790581503; c=relaxed/simple;
	bh=z3ybSAR1RjROS95ZfYl1NwdkXJlLsMqx88ERYy2/t7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=enStACQ0qRKFsEubAUqnEiNRvowttje/NJTbKhEKkEdHNNCV1DfpmpbJOuuqY2J1pYhgXnUylNpQTXC/39LXnhiZATYv249nDph8MCSU+oNDjsgBNY8LHrLUX5RGVTzC1pzcQ8w/jC/3YT5ys5qXYvNXj8yyH8e/kyj9kMzgscM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5BHuuqh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a7T6MKLq; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5BHuuqh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a7T6MKLq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RLJ7eC3220433
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3pQDLIqnV6XgFwKsN9XBt/C95TIkcGyXx3vKiWOmjWU=; b=b5BHuuqhcM20EM2n
	ku7gDdVRDCAb+tfFj5VxCvzQy2VU5wkqPcGwZvycuHLvx1LTnQusCtvIGzPPCAdb
	3OhVyiWfpEeyE239gtCV1VLFwJsw0Tj63L0cb7XRj71c/sVPHm3sLLBr/LdyOJmm
	4JOK9u+oXcqLpRrdOFldpF0GJdxo5UiypTDq2ddDLk/koT/KLn9BAfDND18ivLzl
	GaIE5KHfQ1FtmaVGIhJ5uLyaf3lDG7+894VYlKUwfWOf6D7THxUQW+MBvmkBZL/C
	PsdtdUOwrxU7Ea81oBq+J+x+7PrS9gWOwZcRqMQ9ApF9nuPpFt93JZGTimOkj+eZ
	4Guqlw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav49cdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:45:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so570974985a.0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 00:45:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790581500; cv=none;
        d=google.com; s=arc-20260327;
        b=ZjgXcyuiR+78v3OliyQ3iUDEk+kGIX1m1kbhvXHhPTLy1459nHwB2azUh6dZ5ZqjzT
         okr5+WHAgp1gIdTyYWy2CLkaLwcp5u2F2uwqZL1eUbtEKk7ejEGcUK3Bz6V92pkmF46X
         dlMBMSckidV5gz32WRfuvJ2Pb2G9W0a1RFfXtTUJpDoMXI4g83+LkEVjiwGMLbVhwjZm
         Y9hrhD2VRTfsdAvRVC8SpDAziV4vG89wIgLdr2Ij7uBEOIXG5+/yFRc0aFfgUx5YJF8F
         6pUXv5jqCzKBy98TbIKZSTDKCifshHgmg3yjfLIh0k2ECdbes4ihv5N3zC0ko2kcjyz7
         c7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3pQDLIqnV6XgFwKsN9XBt/C95TIkcGyXx3vKiWOmjWU=;
        fh=tdUDemX6FQnR6Wxcy8Grnsi00dw5T2f23Wd5o9HPPuA=;
        b=ERISZePOVg8I73/WAp+6PcCSjpmLSRbZEhEn2t90TMONKzIgVqXY1tXp3nRZ7SIPx+
         kwc4Q6scvjMN+MKWyIfbEV6mzUvy/9H8s/zDbp2JmxvlmEfeigm8YQVAtxuKMdvb+DYS
         8B0Tyy8BdLfsvXYV+zDrNUqSR2AR0PYz+OYpqa9nSzRnxNR8Iivbwz8blUlOxY3Rv/9/
         YWNmUZht5Yx6UZYSUqz/UG2kTcbkwG/EwujA0dRjHAZAqaKHMhEvl2HwJAIIvJh4TWsh
         +vhOowuR3RCApzHIvbzVrGgQDfYpPbjcJZHDmY0p1bnXp+450dNQBAVGCPyKlza7AMmX
         Bc7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790581500; x=1791186300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3pQDLIqnV6XgFwKsN9XBt/C95TIkcGyXx3vKiWOmjWU=;
        b=a7T6MKLqHzBkSBybRG9NgpOx30qrjRH/fxn0br0r01c86wmWbWXxvaHTXj6joLaIZp
         oUUEsPAStMdQl8C1iK/RLCGca2kE3bxA61qE3Ko+kgfhcgbxysRqfyR04Vnc0ne/q7W5
         eHocHzvDA8EhWbjP1NdL1umJeWcOSi9jOj512iDSGhI0LFML4XwhX4WfaipCPrRbSnK7
         39T+fo9CnmZTq09e2JaY5zb/cO6V/tLfRTMj2Afk7x6vFRaDJVa9mI10riMzOuPIHCvH
         ir0AOpwyILJvyPND4UkYNmVds8rQTSCvLwdxq1Rl6BvRPpp3HTNQQ6F7vzlgUYLFgJBz
         zbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790581500; x=1791186300;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pQDLIqnV6XgFwKsN9XBt/C95TIkcGyXx3vKiWOmjWU=;
        b=Q83UpLfi4E7d7Iou0Fg80zf53Zo5MFof5eS703+igR1KJ0FUkRel6NhwEj7a8+11Cg
         suN36ecTsOLdf1k8P3tuTuyOlxl+r0w2ZI4nXnPpJ0nr1e17RtynPJYjxV44A6RkNddE
         /BmyFg0FD4Yr2YLl6ARqktoQ1hy1pedM75T/1GfAgAsUhPPzoR5Q5Vheiwjnv7u9wz90
         yESnQ/w1S10HATloMss7BOZ80UgCtJZS/iZvs4NdixxChbOnry9KLhZPQzyMUI71//Kc
         eAS+8IOFNGdZkyUJmihyU7nxFneMcS4yCAOhq5ZLkshqIsBEOHxJA3UF3OXThjwxI4q3
         f9ZA==
X-Gm-Message-State: AFuF++mRLTfv77P9GqRJwI6mXrEEck+vprdIR3gY4nSiETCzL8mPfFWd
	sRNMxR1ftBkTWmWEb+blDe2iB3z8SFvPEVNl1CsVTHIdrjDr9FHmI/KBMCrSWpMlXoP6KFjaeXJ
	MUSPuwby5M2wxUl3Z5Qlp+uAW0ExfTjmHC+WVSa9+u7UX64G+0a24SgUAEgFZGjwpMb6rtjlBlE
	UDyPR8fWheCuKVT2wOEOY3FHn9vkT4ou2Q7tSomRSTrHXUt6rSz9k=
X-Gm-Gg: AYBFou1ksBe+NBeTurpRG9IFPvhU3MrbdG3hAOxAhLI9yCAQfwqJQ2FN5+iicbpB++s
	M3Tr/X8mpU79qvcmUk6Qxn6ViPL2Vt/fnU6kknQ9X7WEGI/VZmgXzv2l5iEE5PW4qwX87pXO6t9
	A0OWqiQbAt+6iiEaJX4jFMedxI/sHKF0+BsA84jnOIG4HMcFDc45wiTjWaBpV329ZQE7MzO54cB
	Vs8RSl9QVzsCRUzkrN43qAay36BAQO1U2v9MznYSRfQPuZcPQCjGKu4DYnPNoDZkK560FJL0rw=
X-Received: by 2002:a05:620a:294b:b0:93b:d79e:18ff with SMTP id af79cd13be357-93c43d4ba9bmr1984537385a.66.1790581499841;
        Mon, 28 Sep 2026 00:44:59 -0700 (PDT)
X-Received: by 2002:a05:620a:294b:b0:93b:d79e:18ff with SMTP id
 af79cd13be357-93c43d4ba9bmr1984535485a.66.1790581499390; Mon, 28 Sep 2026
 00:44:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928064336.272659-1-hitesh@ebytelogic.com> <20260928064336.272659-2-hitesh@ebytelogic.com>
In-Reply-To: <20260928064336.272659-2-hitesh@ebytelogic.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 09:44:48 +0200
X-Gm-Features: AclHuK9hApuGcqb2TgGBOk9URRTgJaOtK73cfFe5VrQ6E5rTeeTWYHLjrX2X1us
Message-ID: <CAFEp6-1bzpToGqNuEVbJx7A6L150viJ21L+arYRss-3OwKeEmg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] media: qcom: camss: vfe-17x: Fix write master
 buffer done being dropped
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
X-Proofpoint-GUID: qDXg-phH0oaTrg8ioDMu3Ep9JfA2Tywp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMCBTYWx0ZWRfX9px9RB+3RYN6
 deiRVxv/xeA0iWLAr7xmt0euVdD5PAIIQtGFSQVXRSXvmzYr9mPxBUZOyMFRZZM6Nlq0TrDGJIk
 JqgtPLAl3Jll62Nt/V4WH91zU80XDzHHySySQqHc3DgunYeubnBajrQI8onk9bp8TpZ24KWeUcO
 PV4Id6atMdH5y5Bbqj3DMa3LhMVqv5n11jhcOGxEHV6O6c2v3NeV5C53OKPwS2C3hj7hHnpcW4z
 7NPfesahN121sBC+y+66KzUBc870ihFTryQ+KO3d0TxChhPzuUFV/O/SRR528kp8QjaAXmO2v7c
 oG2W04yJm2VYqt/V4Vn6kCE5skDbKBXNZ83VZH1aexgdwPV+rKrCzTQDOMhtckt/9t059abCLRj
 +3kztvLTwZuRXIYtHSs7VlY0sZY3TmjB5YiegVoEwz692Wg1ozUDyhwe/303grSmxlWBOpFmmLj
 a/k9uy+GtUbFhuuuJDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMCBTYWx0ZWRfX2EMlIBXONZbQ
 cFcJ2iVkrq2LiIKYuuFS73LYMhDHUYTOHjCNkQgbIHQ/jmmhvaei0MbKTDb8J8P/khsNzyQgsI6
 NYU8aWx/m1QJx80UO5GJfGRRejdHXM4=
X-Proofpoint-ORIG-GUID: qDXg-phH0oaTrg8ioDMu3Ep9JfA2Tywp
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba1afc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=ZovgdgjKAAAA:8 a=EUspDBNiAAAA:8
 a=9UK9mVl4XDNobURrqqEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280030

On Mon, Sep 28, 2026 at 8:43=E2=80=AFAM Hitesh Patel <hitesh@ebytelogic.com=
> wrote:
>
> The VFE 17x interrupt handler reads and clears the bus status
> registers on every interrupt, but only acts on the per write master
> BUF_DONE bits when bit 9 of IRQ_STATUS_0 is set as well. Bit 9 is the
> ping-pong flag of image master 1. It has nothing to do with the other
> write masters, and it is not guaranteed to be set in the same
> interrupt in which a write master reports a completed buffer.
>
> The bus status is read-to-clear. When a buffer done arrives while bit
> 9 is not set, the handler clears the status and never calls
> wm_done() for it. The buffer stays queued in the driver and the video
> node never receives that frame.
>
> With one RDI streaming this is rare. With two RDIs streaming on the
> same VFE, for instance two virtual channels demultiplexed by the CSID,
> the interrupt rate doubles and one of the two lines loses buffer done
> events continuously.
>
> Act on the bus status alone, as the other gen2 VFE handlers do.
>
> Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version =
Titan 170")
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-vfe-17x.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/=
media/platform/qcom/camss/camss-vfe-17x.c
> index e5ee7e717b..c011f64f63 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> @@ -364,9 +364,8 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>                         vfe->isr_ops.comp_done(vfe, i);
>
>         for (wm =3D 0; wm < MSM_VFE_IMAGE_MASTERS_NUM; wm++)
> -               if (status0 & BIT(9))
> -                       if (vfe_bus_status[1] & STATUS1_WM_CLIENT_BUF_DON=
E(wm))
> -                               vfe->isr_ops.wm_done(vfe, wm);
> +               if (vfe_bus_status[1] & STATUS1_WM_CLIENT_BUF_DONE(wm))
> +                       vfe->isr_ops.wm_done(vfe, wm);
>
>         return IRQ_HANDLED;
>  }
> --
> 2.43.0
>
