Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B584F4753
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 15:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076429; cv=pass; b=VCyOSiaeQIQml5sG0ZU7bFdp1Zq+wE7UGz0ySbKXZ06YYDIykXL0ao9SsJMeRwiXJVUVX/YCrvYTPJfagBCdRLd+sB+k48cGwzJIlTYebVbCHcpPfUk9BpNsNc3Bx5+9kCqnV8ydX5YY/qxM3PFv3/3Ga2OTjyK+M4c4yn7p//Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076429; c=relaxed/simple;
	bh=9AubrjuTyFtTcB47akR0Z0Pa9zMrPvbyYIyhySwc51k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MnClM/cO2DgF15Rs3PNMQbMRV9qILyHcxvXM0rty2AGUXz/OGls5I2qGpAITMfLyNwqE1UYc8nU10teKRxPk/GVlenOoz4ygcRq2doPbileipMTL92586y/VWSsumfFoyS701hCATuvFPyRLaema0s3GlXc1mNYzLplr4gCK+YI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0UE3sjh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aj7I3o9V; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L0UE3sjh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aj7I3o9V"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FDYNOd3462711
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 15:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9AubrjuTyFtTcB47akR0Z0Pa9zMrPvbyYIyhySwc51k=; b=L0UE3sjhpkGmhWcD
	KoOduoIpJoA5a577JSZoePOLGX7e0v26yx67AbT0UmnzIES/59j8NaNAmujSvo/t
	+RaQhZNWWVMJdzdxjDb9qxZjR5OhXQBs/79pve2O2qFAppZQZC785B9p0VdBTIQX
	brXi7j5V332kv6AMTtCwBzoOVdr5kDUd6VoX7wlPgbSPAO012InaFRBcsEzg4zpE
	CZMoZeKnIr5yvPZzx42HkPVrpSI0wIheotNwc4Mod4TdfJm7roYHOsLgL7VdAxKa
	zwfHVIoJOvXFluitnuDTWiOym2MPWAgGECHEXZdKxD0LmXqVctIjAtfIxnjJjNBL
	gVRiVA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hayu68c5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 15:00:25 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67901cb4b08so8323410d50.3
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 08:00:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792076425; cv=none;
        d=google.com; s=arc-20260327;
        b=hhU6OXlSXq5PscBde6gngXveifcFs2xKo/SlCwt856cApr4L063fl6zCUVu6U4NMab
         FjXfVO0A2VLfnz+xs2Rup9QBDGBNatAxwJ4gN9v0U6CxXebMkhDib9ijNdjsShq/4eny
         wY9XE5KUYeF8RU8XGN64zu+bbOR1zqR+F8tflz8spQy/Q20zlF+jol6RslOSL0qGEThc
         PqUv38WJZ+y9nKKd5mXULu883vBc+qo5udqycn0gP3XFqHfbuCkHqtmaUkcwdaEy7h7b
         dg0ABvMMPriAhL499FuZ8ZVm6DzDoB9N1iyEQUhgdQDAUy3HcsPjl/w8rDwKMpuWFCdC
         OF2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9AubrjuTyFtTcB47akR0Z0Pa9zMrPvbyYIyhySwc51k=;
        fh=SV3NiGk88QAcoZO/7HGfASO+VbRtnQ7fpZ7l9C9EnBg=;
        b=Fj/X5FreNrSDS0yCV9h31pAAX3bpnSIiuyzCU+pkjW0JoqIdtYPBuYrnXxZM9Mc8vE
         xVVIF/GORZYnUuOMnCBVhivaY4nlTfWVV3ETaj4E/mcaofqnpSiZTqqeZnO6a4klPHRG
         9oOh8Vg78/iPtENl6aC+aGKpJDbgUQ0AdYv2UnnMzQHtt8OShnca8gS8d+XsrwL+Y0eD
         zxhA9XGmYHH0feZV7u0WjF3dSoJeA35m1Fmh4a/tshSwOWsKxICHwSSeGWF0+0W10lYD
         ApsTEu2aCyRSemkI5zrKAeHAy/R53p9fH/ajbLX8nZBC3c3zK66etvM6OQ14fryaoF/1
         JgSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792076425; x=1792681225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9AubrjuTyFtTcB47akR0Z0Pa9zMrPvbyYIyhySwc51k=;
        b=aj7I3o9Vk4jvllzD2UDEM2pe1ozVBL9izyYvproMKqq42Fl5Oo1wwTU9NYSYtPUP+n
         5/HvQLKU6iPa3NNUVcoM0N+46Wq+FRRvHdAPUHfypuZsNCzKTbu21xREF+9Y+jjZu+w6
         ScpNN2gmKoosssV4iS0v3Lj0nyXNPCAqqeSNuPZqohouCLLiU7qATFTF6c0I3lO46USf
         Yy3/RzCESYHlUEu5jxfIsdYOenzSCvHYyd2wR1JQW8cDXS/SbcYKJh5F73KcY0kxMA7n
         9RayyhRImmpENvkaC1UrW96OfgJzzz580oBdlRAEE1pvCCanmU4keWqrblRofMna+pKG
         u38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076425; x=1792681225;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9AubrjuTyFtTcB47akR0Z0Pa9zMrPvbyYIyhySwc51k=;
        b=CNy9DqaXmdGz/FcOSMK7AMnJ0MxXPTZBxqHtN//wdPRO3Si2cC6QiQnsswDRVNJeQP
         4KZa1LIz6xpS3/ggCkB8A6WZ7HKc+S8IpoMRegThHvRZ1pvGIVlj/0jrP3O9qL0nKEXF
         JRc460PM66WXsJh2wbEeeFvwI2JzfQpeangTuU+fr+oZyw37XfPRQy6q8Asf3h6Z7jrG
         1mYRzLeKsTmIxQMX5oDI95V0oieXYSolVISx7B8bDh7n34yZv6lKMzQkR1tSfrvJ6i8Q
         8+B83UQVVgHzADXqe+PNgPdajLo+WN/M3e+T0wFHJpqWjPpU7WOf0QJje47zc4McHZUb
         Sumg==
X-Forwarded-Encrypted: i=1; AKwUvBy0Y6hZEVLpzfDmWYrDsXx8OKRzA1ACRwzEx51PhH7fnsZcF/CiDSKGH0S+EUmG1jx2ottUExhZVA+XDw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIL7TPqEywwy8S2Sdf/ZrBz5wO4bG28s8l5OZihY5ECw/j+Jy7B
	tS0T8Ax28VdzMUgbd1RzG1uC6G0pmL3aWpAzjQVR7yKbpKD8tWkriZAYLyw5nU6z7umObaV3Zb0
	sigJqPu28rwbcbUY62y97+dE8GVs9Mb+yLzRKH76nDJOw7MZMmcCa5UNDOWzQROSoZxb8GX0fdF
	RLzfkJkups2lbYBdT66FhENs5IPppy4qk0j9xIZowb
X-Gm-Gg: AYBFou2UKMDw6Fmhm4mBfagwOh+Y3XzhtkfRBqfb9Z1GtjZkBg3gapg4JNCqaVo0vuf
	2VLQ9TBYHjNczEROV4dNxv8LIDYCjBpvryrQ+w5hG9gUi5A0Ey4M044ZC7DGTIp0UJ4nEU4T0TG
	KAlFnU0FQQ7iBWbGEo9PhOv2fWzbuO5n9HKulhTCKd/ujNlMuZWq1vQUfwNQ==
X-Received: by 2002:a05:690e:e8c:b0:679:a56c:e2d4 with SMTP id 956f58d0204a3-679a56ce9cbmr416674d50.21.1792076425118;
        Thu, 15 Oct 2026 08:00:25 -0700 (PDT)
X-Received: by 2002:a05:690e:e8c:b0:679:a56c:e2d4 with SMTP id
 956f58d0204a3-679a56ce9cbmr416649d50.21.1792076423912; Thu, 15 Oct 2026
 08:00:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-video-optee-pas-v1-v1-0-7bbddaaac5ba@kernel.org>
 <20260911-video-optee-pas-v1-v1-2-7bbddaaac5ba@kernel.org>
 <38fa7602-f03a-4343-9999-0eda108332e3@oss.qualcomm.com> <CAGptzHNO02tQJypLjQD+nKWW76m5R2fo-s=bAJhN=Hmu_oVvng@mail.gmail.com>
 <d293c3a5-7318-4ef4-978e-2bf1c064d0fe@oss.qualcomm.com> <CAGptzHN5uTR8w2b3ODHoSTcys4woRBmAf0fa=93H34ZDV+=ymw@mail.gmail.com>
 <9ae0c4e2-35cd-402e-96d0-eccfe26e622b@oss.qualcomm.com>
In-Reply-To: <9ae0c4e2-35cd-402e-96d0-eccfe26e622b@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 20:30:12 +0530
X-Gm-Features: AclHuK8demruQYQ8n8tHl0BDAgZY3hGCZO81qTxG4GuyJEws54lZr76wmzOWfEI
Message-ID: <CAGptzHN1-x+9aoccmes7PSOZfT=SDQK8e2yJc2AQhhQuc5+BZA@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: iris: Skip SCM call for non-SCM PAS backend
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
X-Proofpoint-ORIG-GUID: PgfUCvsOyu8uOegUnFMm7TQzthWCPZhp
X-Authority-Analysis: v=2.4 cv=ff04WEQF c=1 sm=1 tr=0 ts=6ad0ea8a cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=b45o4kL6AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=aQIlNds9TXYcn2LlkrsA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-GUID: PgfUCvsOyu8uOegUnFMm7TQzthWCPZhp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1OSBTYWx0ZWRfXx6ICWN8+LTta
 q7YNUiAUqHLxoaf9LX921o49RqKg6F6bBuGmCA44MC2JnTfqyT8IEGOX+nHzrt7MiTRd6LDCm1b
 EKfiHaPLCsqDfuAfQ6fkRtc7h+gVQyD9pDaqsvu2zHuT/LxvvcCTa0Se4ZcF2aGpbDWiVFVmoWs
 de4NZmjG8nuBaifCwtseEKrFq2cCaCJobE9vPI8M99PFDfaZp5eNcb0Fj8wMhPalw2r7Xodw5Jx
 CxdiRlOz/RTK3QES5/0k/R1wQQtJ/EVR38uuSjg2yPezLoXhvaBDKfeKFEFTZs6mfpKrJIl1JD7
 cLOMRCFAFQjFtGTX8Ey+WkvDg7qrcLRZAxIFjpEpwG0p3qJSVE6FA3tii7O0UJjf6F5igCtSxA3
 V38sD8cSFKc0r4wjow6pWCGXoRTwlIMdifPXfmckCLIv+R8VOzoerwD+mLk0s4m7Z0Zi2CgfOls
 6DEgJtBQD29QIdXlGmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1OSBTYWx0ZWRfX4QEfQ8pzXmMi
 MMSZak8fVEVUl/3GlWEj+5p55KRy/JYYuCEpBCPJ2R+7s4Tn0Vj1CPyOXXwB7yOvbrWcFjEhzPe
 IFMQGvDR1cZUYBz6v9MXxxlx902VBE8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150059

On Thu, Oct 15, 2026 at 3:13=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/18/26 1:10 PM, Sumit Garg wrote:
> > Hey Vikash,
> >
> > On Thu, Sep 17, 2026 at 5:11=E2=80=AFPM Vikash Garodia
> > <vikash.garodia@oss.qualcomm.com> wrote:
> >>
> >> Hi Sumit,
> >>
> >> On 9/14/2026 11:44 AM, Sumit Garg wrote:
> >>> Hey Konrad,
>
> [...]
>
> > The main disadvantage is that we don't want to carry these custom SCM
> > ABIs per kernel subsystem with the open source TF-A/OP-TEE boot stack.
> > ABIs always come with maintenance burdens, especially the custom ones
> > we have in this case.
> >
> > Since we started from scratch for the open source boot stack, the
> > motivation is to keep the TZ ABI minimal and that too with
> > discoverable OP-TEE services like the PAS service.
>
> Okay, I can symphatize with that.
>
> Let's think of another solution though, as a strcmp over the provider
> name is 10x worse.

Okay, I can rather stub these APIs via the generic PAS layer except the
SCM backend, that can reuse the existing abstraction.

Although I find these APIs not related to PIL/PAS, it will be
just overkill to have another abstraction layer for it.

>
> What is the planned replacement on the open boot stack side?

In the case of video subsystems, OP-TEE pseudo TA already holds platform
specific info so we can directly add this info there which is being
passed by the kernel in SCM calls.

> FF-A lend?

FF-A surely is already enabled and tested with the open boot stack.
See TF-A PR for Lemans as an example here [1]. However for FF-A lend to
work in real terms when kernel running in EL2 (KVM mode), we need
capability to be able to unmap buffers from kernel linear map.

See this proposal from Google where discussions are leading towards
making the generic CMA pool capable to unmap buffers on arm64 here [1]. It
will actually unlock FF-A lend use-cases in the kernel.

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/54873
[2] https://lore.kernel.org/all/as4ATqhp0bPI03PA@sumit-xelite/

-Sumit
