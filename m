Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1EC41A76F
	for <linux-media@vger.kernel.org>; Sat,  3 Oct 2026 14:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791039395; cv=pass; b=gjq+AZ3EbywDQfxupyjYMDyYj4summBXXPMB9fbW15kIFUYh3PCkvp/U52ecduMQWqFOLPuoUBhNwSR9k02VbMYBOTgDi7PngaEUFz3m+0EIkDdpGk5I+TtgXHpxxK9bWdWnEItadZ5sAKVZroCoVPM3b+AEDzi9F0SRxxmTmlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791039395; c=relaxed/simple;
	bh=6ldQor9BVvQgAIxlaOjkzjxKvhW5KswMoTOyZVW9B30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S2wI+KXwP7EkusiUojH6PA+HgrwWn31u5vPm6lrQu5z+JKNkImHShJ37buOOAOAd5M5j0Pn7rN7cbrXg4yOIxsuimDEdBVce/LxtZ46zYyTs8hvLKSj9Sh6eB1TWnRASoS7Cnkh0UUvAOGJBjJ3B302fxKIDVDXQz0kYzR+S1Mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKkj9Z8I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JULZ2835; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKkj9Z8I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JULZ2835"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693E6pW81440894
	for <linux-media@vger.kernel.org>; Sat, 3 Oct 2026 14:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJcn42er3ls5oeH7ssiaiQ/CnzqOqoH3mCqFIafWLd8=; b=MKkj9Z8IlGYoYPCv
	TZM3EpQa7/4aHpkpTpDKEBnXRkeHlWAKjVnMZrzUFF5W/Tb8ibClgHpPxtRbJJV4
	krgAfg06+OytRu/9UQeXu8ok6xi9oVMz3Bfk7f5fWvW5GPd1oE/LsoPyShBbdGdT
	Vtmz5PHhMJCd35NBmtH36NIyIDOobrhIvQP5HxjoTWC7dIPkD/ZzW8xUGPz8JNRe
	fBMk0IwZmeKVbNsTlIiZOqGxeAwpG0BcQMV4cG9a+P9cZwSzfXQNlQqSoJNYSQkZ
	fLEQSdfQkjFXjeehamMr2goeim0uRqHPC/4yhegpcpFgrykXwoaFhHp9YGu8CwsL
	W4iZ7Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sssh6x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 03 Oct 2026 14:56:32 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179f0ffb96so15430736d6.3
        for <linux-media@vger.kernel.org>; Sat, 03 Oct 2026 07:56:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791039391; cv=none;
        d=google.com; s=arc-20260327;
        b=Css69kQiiEwbvy1yg45UvP4y5j0EXwtVMt/vXYX/nwbE1pKxYfuP+p6XaNWp1mNOUf
         KOEsKzRjj5mifOMy2BuFCwPPamWk7kyxV9AWDknBLn2ioIkYc2xdsK3FtVI0MgOCj1fI
         +8d0S6Npa8AXtRmfFyFQHjOMsjtksdMv8p5yaG7o/V3rF118atg8xA6vH3Oi5AhNNvcJ
         hLdTc/Yzy+BBAZSSon2AZSEulA1ieyhtVICm9usTXFYwk41OWMG6cS0Op9V5HLE993/Q
         87DuEnKKBjelvD/YYPy2ovIpyO/apNUc8eVJRAbBcbwn5fyUbrFh8IY1kkHa7C1/uxwZ
         6w5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zJcn42er3ls5oeH7ssiaiQ/CnzqOqoH3mCqFIafWLd8=;
        fh=zUu9W74LRgyTuKesSYzow7m5BTzJKqjyvFsjT0eAYU8=;
        b=MAXwghzmBrIudEUeogDZpoQC1PxdAkBZ34hbkBJ8l6orH7h3rr6NlM+1LkkkF3NjhX
         ujXLrezWYXty9P4JEmi/aJ9wypTZsjqgYZhqY/yTOApdgzQTXPnuQvZGZ4s+as/EU8Gq
         rAQd6QFiRLv7QBxtcgEdMaqrUPAJP36Vn8HpKq4hkntqb5EEJcq5xgQjU4xAfpVuRapB
         k0idhc4fKkqM8m5eKtgalh40dPK/K8WBWt0aDEgkvTHjuzY0OvZxq9ft20AhCMwkehpM
         zBwLiHRUK3wPEJha8j+76jY6ErA1TIZ58thZYvF6yWFx6iZkPpulzTbSfA7qwUmUfoky
         8uyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791039391; x=1791644191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zJcn42er3ls5oeH7ssiaiQ/CnzqOqoH3mCqFIafWLd8=;
        b=JULZ2835U/vWSo61LHLk/1xy78Fd/VkN8CKrOIR5FLNCbHSbuI0gAkxIjz/e/7OHYo
         xXYb7AiUQxRapr8HxhKOkmjfQPTVfhfKWiakRUKg2mKYaX8zPkvmLnBFzGl1qUDgLW1G
         SMhimNBPh6s3wVdniih0ETH9tbzp2Pf9jtQMDa+YSyiQ1Aivk1dN0mkC2TNm3W4jteTK
         761mHHFVLUKtgNJLPQGwucRn5lHZzuVENS1DxXMXDyNW52t3ienWngKRWkEADL6kTS9f
         +7wl+GMa+XXaMFbgzynMBPxRL1AjUPNWRg8GRi9t2q3nlXnGllqdrjh5+RptjE+5FQVO
         l7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791039391; x=1791644191;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zJcn42er3ls5oeH7ssiaiQ/CnzqOqoH3mCqFIafWLd8=;
        b=KhT/ckO4RbM3Qt3zS5/FsA9iOT8A9vYzSrVa1uhVMHs+SVoVCy1hDH81jRAEPmJu9S
         Px5c2Ypv1xZf53XLRE6EAGquH+UoBYISuRG8HZPQIvwNJnpebHps1QzMxHZjtkq/ZdWS
         sj1dRWW/pJfugRt2ghpgm8tyiwN7IMp5mYWeKkLNUbvHAZ2xOTcPv9CmLJN30AUrcWie
         fdnhI5zV7jViCkQd8Ls/Np4lw/GGMaVPw39NmZAInIUCntUyK0/foHtZFJfwhin4N/2R
         mJUWO6bwXhglR7CFiu7lbuP5n6zg8IK9saLl8FKVLacDdAJw535VZcbmoNHma9mfPgg/
         HrLA==
X-Forwarded-Encrypted: i=1; AKwUvByxiqcB/5bzHmAPLVrL2/Py3IBQS6ogIqMlmlLlLFXp8MlH0Nda3Ybfunr5O7AipqBEJG1Np00Yvtg2Bg==@vger.kernel.org
X-Gm-Message-State: AFuF++nHXmZtPZty9vNNb93Fd11uNjbAWg2z2DOBCXnsmxYuaViHajOz
	JLgGC8WWljHzAfAsbAppMPT6HUs5AEtKtYxt54WW8A/P+iLkjR44RiHXj6Ms+wVdcfE+WoCgC0m
	wJISX2TnS2EsYpdjn8Qa/Rh4C3xtWGGR7Hc7DExbvZB+sqXQ6wQgzhChdlt8CkuPxahDx1K2BsR
	NZJvCLrhVZgKGig6OM7zJ0EbdTt/eOxT7b1s64qZORMuo8U3Cn
X-Gm-Gg: AYBFou0sBq0oOEyHQEzTTjXjV39lf8BvHVrL9n0i/wKPxY2zS2Mx3Pcc7lXq1yzPs1b
	+nlnnUbGDKqyWyscuuq2DoHkxmBi8GH8yydmUAkx+gZG7hvCb0ZnLEPvUNa/iKcbIJk+cU7AItn
	aYxU6eso3Shmog6rSjP/ethUOnIZMfOaof+cBYcj+7DIPcIjknFIxJ8jtVSMwfqb6eKelo/kUJ6
	LAYF+WfW7vKyzJ7Gt66PU1S8RwBvzsbtBdR4rO8edJ44JyOjyBw7vNfpHiJ2qYgrEUPmLuJ4iw=
X-Received: by 2002:a05:6214:e86:b0:917:a041:2dd3 with SMTP id 6a1803df08f44-917c01d607emr126298646d6.43.1791039390615;
        Sat, 03 Oct 2026 07:56:30 -0700 (PDT)
X-Received: by 2002:a05:6214:e86:b0:917:a041:2dd3 with SMTP id
 6a1803df08f44-917c01d607emr126297986d6.43.1791039389924; Sat, 03 Oct 2026
 07:56:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914233810.GA2796257@killaraus.ideasonboard.com>
 <93b0e5fd-5570-4418-8bbc-4b18ef5e419f@ideasonboard.com> <20260930-boil-capitol-19514aea9236@spud>
 <179095764618.1027537.15476078497656119934@localhost>
In-Reply-To: <179095764618.1027537.15476078497656119934@localhost>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sat, 3 Oct 2026 16:56:18 +0200
X-Gm-Features: AclHuK8_Eg6QECagOwh-gaZziH7OYlC42LIYc-HgT-1KwA7Q4UGsbDvxGTYIWiw
Message-ID: <CAFEp6-0NHXQ2H6UFbkhY2qLMeKbk+kBqkAsmk89CQcNpGQNGyw@mail.gmail.com>
Subject: Re: [ANNOUNCEMENT] Camera & ISP at Linux Plumbers Conference
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Conor Dooley <conor@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org,
        Loic Poulain <lpoulain@qti.qualcomm.com>,
        Michael Riesch <michael.riesch@collabora.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA1OSBTYWx0ZWRfX9UOKvZpKWPW/
 wSOyD9B0neYrPHDKmvpkxMIr0kmD+zDIZxoJMEluNVJ5cI/9Gud8dTZKZBBJzbLInu6q1kOZiO8
 vCifbi/ckrs1RLg2Cp4ERIAm2j81evA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA1OSBTYWx0ZWRfX2BqSUOwM+Tlb
 yFnJBtqlbicUi8M3SxxlwAK10KkPEFNgXPJGmrjRCrST+8Xruhvu9odwoweGNguVzXairPJ5Xe0
 PECJSKECFhKeUnWlamFyNmL+hsTPPWqYviW1HcDL6vb2fxvffpH0sTfJQMCUrvLs/xXEsIn7qDm
 SqZ4oqSAdRrZ+hOl+tGROf3asCnVn4uJKUmYIxWWfLqjwK1M0ayMKQXSEh6XoLIL4g4HS/9rzRB
 dFOmLbDF860bN4012WqR+xbn/7Tc0EtB6cT1U/7coLYjT3kjKPraeF/mNsyDCWSk2ybasPH2tFg
 5sg7rVfn0SNvNc8N7HOYfSN8GN/9MWcYO0kLdaCO/sOVSk0sDcU7Q88BxEehIsbvfvKidZInsXQ
 kqlQHgQJeEollElQgxhedf/YRo6lLwon+Qn+UUBe9Av0+PnE7qoAZhteWMciUcgw4CO70VbRdXW
 JByguV/PV9v02AJK5AA==
X-Proofpoint-GUID: SEq_3dvaVvfAXwtpSO6HPtqG1urEL4Z6
X-Authority-Analysis: v=2.4 cv=HqjjiETS c=1 sm=1 tr=0 ts=6ac117a0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=P1BnusSwAAAA:8 a=1WT8fKCLDG5vF6B6xHUA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: SEq_3dvaVvfAXwtpSO6HPtqG1urEL4Z6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030059

On Fri, Oct 2, 2026 at 6:14=E2=80=AFPM Stefan Klug <stefan.klug@ideasonboar=
d.com> wrote:
>
> Hi Conor,
>
> Thank you for your fast reply.
>
> Quoting Conor Dooley (2026-10-01 00:01:44)
> > Hey, just some quick thoughts I had, mostly to fish for more informatio=
n
> > so I can be more informed..
> >
> > On Wed, Sep 30, 2026 at 01:18:59PM +0200, Stefan Klug wrote:
> > > Hi everyone,
> > >
> > > On 15.09.26 01:38, Laurent Pinchart wrote:
> > > > Hello,
> > > >
> > > > As most of you already know, the Linux Plumbers Conference will hos=
t a
> > > > Camera & ISP BoF in Prague in three weeks ([1]).
> > > >
> > > > The initial proposal for a microconference has unfortunately been
> > > > downgraded by the program committee to a 45 minutes BoF. We have
> > > > therefore decided to limit the discussion to three topics at most. =
Two
> > > > topics have been approved so far:
> > > >
> > > > - RGB-IR support in V4L2 and libcamera
> > > >
> > > >   by Rishikesh Donadkar and Devarsh Thakkar, Texas Instruments
> > > >
> > > >   The Linux kernel V4L2 API does not support RGB-IR image sensors.
> > > >   While building blocks necessary to handle those devices are slowl=
y
> > > >   being merged, RGB-IR support itself hasn't been tackled yet.
> > > >
> > > >   Rishikesh and Devarsh will also present this topic at the OSS Eur=
ope
> > > >   conference ([2]).
> > > >
> > > > - Camera module identification
> > > >
> > > >   by Stefan Klug, Ideas on Board
> > > >
> > > >   Camera tuning and calibration depend not only on the image sensor=
, but
> > > >   also on the lens and other characteristics of camera modules. Whi=
le
> > > >   Linux supports identifying image sensors, it completely lacks the
> > > >   concept of camera modules.
> > > >
> > > >   Identification of camera modules requires coordination between
> > > >   platform firmware (DT or ACPI), the kernel and userspace. Discuss=
ions
> > > >   will benefit from the presence of DT maintainers.
> > > >
> > > LPC is already next week and we won't have enough time on the BoF for=
 a
> > > full introduction to the topic. So this email summarizes the Module
> > > identification topic and contains the questions I'd like to discuss.
> > >
> > > To the device-tree maintainers: I added you to the invitation as this
> > > document proposes new device tree properties and I'd love to get some
> > > feedback and common understanding on these. So if you'd be able to jo=
in,
> > > that would be fantastic.
> >
> > I'll do my best, there's some schedule conflicts with the RISC-V MC for
> > me, so we'll see how it goes.
> >
> > >
> > > Most of this mail is introduction and context. If you are short on ti=
me,
> > > please jump directly to the last headline "### 4. Camera modules with=
out
> > > data storage" which contains the most relevant questions.
> >
> > >
> > > Q: Does anyone in this group have more details on which information t=
o
> > > query and where to get more details from the system?
> > > A: ...
> > >
> > > ### 2. Camera modules with an embedded EEPROM
> > >
> > > To make use of the EEPROM data from user space we need to carry two
> > > elements: The EEPROM data itself and some identifier telling which
> > > format the data in the EEPROM has. This seems relatively straightforw=
ard
> > > and we could model it like this in dts:
> > >
> > > dts-snippet:
> > > imx283_0: sensor@1a {
> > >               compatible =3D "sony,imx283";
> > >     ...
> > >     eeprom =3D <&eeprom>;
> > >     eeprom-format =3D "vendor-a-eeprom-fmt";
> >
> > It's nvmem-cells you want here I believe, and the associated layouts
> > should cover the format?
>
> Oh, that looks good. nvmem-cells seems to be the right thing here. I'm
> not completely sure how the format would map, but I believe that would
> resolve itself on the first practical implementation.
>
> >
> > > };
> > >
> > > Getting the link to the EEPROM from user space is something to
> > > investigate. Ideas are either sysfs or media-controller.
> > > The eeprom-format must be specified as well, to tell user space how t=
o
> > > interpret the EEPROM data, as it is typically not self-contained.
> >
> > If you have the format of the eeprom, is it not better to provide the
> > parsed version to userspace directly rather? Or are you concerned that
> > these things will contain such "random" and non-standardisable info tha=
t
> > it is a lost cause?
>
> As the data is of no use to the kernel, I don't see the benefit in
> standardizing it. On the other hand we are missing practical examples. I
> feel it is a bit of a chicken and egg situation. There were some
> EEPROMSs, but it is difficult to correlate them with the camera module
> so no one really used theme even though everyone would like to have
> them.
>
> >
> > >
> > > Q: On a first discussion on that topic we were unsure if it would be
> > > preferred to expose the data directly in sysfs,
> > > or to symlink to the corresponding sysfs entry for the EEPROM. Any
> > > preferences?
> > > A: ...
> >
> > FWIW, nvmem already has sysfs for this (first option in the nvmem
> > Kconfig menu).
>
> Thanks for that info. I need to toy around with that.
>
> >
> > >
> > > Q: Any input/things to consider from ACPI side?
> > > A:
> > >
> > > Q: What happens if the EEPROM driver is not loaded yet or is just not
> > > available? Should it block/defer probing of the sensor?
> > > A:
> > >
> > > Q: We are missing real-life examples for these cases. So input from
> > > vendors would be welcome.
> > > A:
> > >
> > > ### 3. Camera modules with a sensor that has an embedded OTP memory
> > >
> > > This case is similar to the previous one. The big difference is that =
the
> > > OTP memory can be handled by the sensor driver itself, so no addition=
al
> > > driver is necessary. In this case a practical solution could be to
> > > expose the OTP data via sysfs. Handling in user-space is similar to t=
he
> > > EEPROM case. So the device driver could expose an otp_data and
> > > otp_format attribute in sysfs for user-space to read.
> > >
> > > The property otp_format contains a name of the format of the OTP data=
.
> > > There are cases where the format is specific to the sensor vendor and
> > > cases where the format is specific to the module vendor. So it should=
 be
> > > possible to specify that in the device tree.
> > >
> > > ### 4. Camera modules without data storage
> > >
> > > This is the most difficult and most controversial case. In this case =
we
> > > can't identify the module automatically by querying the hardware. It =
is
> > > also not possible to rely on the machine identifier as with example 1=
.
> > > Think of an arbitrary camera module connected to a Raspberry Pi - the
> > > machine identifier will not change just by connecting a camera.
> > > Therefore we'd like to supply all necessary information with the devi=
ce
> > > tree.
> > >
> > > The difficulty is that the combinations are huge and there is no comm=
on
> > > denominator (for some modules one might be able to get an SKU, for
> > > others it will even be difficult to get an official name).
> > >
> > > This is quite contrary to typical device tree use-cases where we try =
to
> > > tie down everything as far as possible.
> > > A flat list of module identifiers (like compatible strings) won't wor=
k
> > > as it should be possible to standardize aspects of a module, even if =
not
> > > everything is know. Think of a Raspberry Pi Cam HQ with a screw-on le=
ns.
> > > It would be great to be able to specify that module, but the lens is
> > > still up to the user.
> > >
> > > In [1] I proposed a possible solution to that problem. A tag-based
> > > system with a single device tree entry of space separated tags. Every
> > > tag carries a prefix to denote a category:
> > >
> > > Tag                 Example
> > > m:<ModuleName>      m:vc-mipi-imx296
> > > v:<Vendor>          v:RaspberryPi
> > > l:<Lens>            l:generic-8mm-ircut
> > > s:<Sku>             s:B030801
> > > u:<user defined>    u:my-selfmade-module
> > >
> > > This is a bit like the existing "label" property which carries a huma=
n
> > > readable label. So an example for a module could be:
> > >
> > > imx283_0: sensor@1a {
> > >               compatible =3D "sony,imx283";
> > >     ...
> > >     module-info =3D "v:RaspberryPi m:camera-module-hq
> > > l:generic-8mm-wide-angle";
> > > };
> > >
> > > This leads to the immediate question: Should we split the tags into
> > > properties?
> >
> > Yes, make use of the standard utilities before rolling your own format
> > please.
> >
> > > imx283_0: sensor@1a {
> > >               compatible =3D "sony,imx283";
> > >     ...
> > >     module-name =3D "camera-module-hq";
> > >     module-vendor =3D "RaspberryPi"
> > >     module-lens =3D "generic-8mm-wide-angle";
> > > };
> > >
> > > Pros: We could try to standardize on some values.
> > > Cons: We add a (possibly increasing) number of properties that have n=
o
> > > value inside the kernel and will only be populated very sparsely.
> >
> > What value do they have anywhere? ELI5 why anyone cares that the rpi
> > foundation made the sensor module, for example. What decisions can be
> > made on the basis of it? Not trying to be antagonistic, I genuinely
> > don't know what kind of things it affects. The lens type or some sort o=
f
> > nd filter info I can understand being useful. That said, and I know ver=
y
> > little about cameras, some of these things could actually vary at runti=
me
> > right?
>
> I think the difficulty here is that we want to identify something which
> we can't even name precisely and we don't yet see the full spectrum of
> possibilities. Regarding the question who cares if the RPi foundation
> manufactured a module: It is just a way of identifying a specific piece
> of hardware. So there are many modules out there using an imx477 sensor,
> but they could differ in the geometry from other ones.
>
> A compatible string works well for devices we know. But then you can
> quickly come up with cases, where only an aspect or part is known.
>
> - Raspberry Pi Camera Module HQ
>   - Lens is unknown
>   - So we could start to unroll that
>     - rpi,cmarea-module-hq-8mm-lens
>     - rpi,cmarea-module-hq-9mm-lens
>     - ... that doesn't scale
>
> So we could introduce a module-lens property:
> - vendor-a-8mm
>   vendor-a-8mm-ir-cut
>   vendor-b-8mm
>   ... 1000 vendors more
>
> That doesn't scale as well.
>
> I tried to further reason about the underlying targets and why my
> gutfeeling doesn't like the compatible.
>
> I see two main targets:
>
> 1. Finding a solution for well known devices like laptops or phones.
> Upstreaming a compatible string per module could work, but we will often
> just not know the vendor of the module. So they would be named
> (incorrectly) after the manufacturer of the device.
>
> 2. Upstreaming overlays for well known camera modules like the ones from
> RaspberryPi.  I don't expect that to gain too much traction quickly
> because of missing specs for connectors and therefore no way to model a
> camera module in dt in a way that works for multiple processing boards.
> Still it would be very helpful to be able to write dt overlays for these
> modules that work with an upstream kernel without the need for nasty
> hacks (like abusing the label property or so).
>
> 3. The same applies for full custom solutions where upstreaming
> compatible strings will never happen, but we need the overall mechanics.
>
> So in summary I'm looking for a place to put a blob of information
> regarding the camera module that is not of any use to the kernel and
> only passed on to userspace. Defining a separate node and maintaining
> compatible strings seems like a lot of maintenance work for little gain.
>
> Looking for other places to put that information doesn't lead to really
> good candidates. One could store it in the software image itself, but
> that is a pain as a user would loose it when flashing a new image.

There are special hardware or logical partitions on eMMC/UFS devices
(e.g. mmcblk0boot0). These partitions are typically preserved across
normal image flashing and even full user-area erases (mmcblk0), making
them a convenient place to store device-specific information when no
dedicated OTP or EEPROM is available. For example, Arduino Uno Q
stores Wi-Fi and Bluetooth addresses this way.

That said, if consumers rely on nvmem-cells, the backend becomes
irrelevant. The data may come from an external EEPROM, SoC OTP,
eMMC/UFS boot partition, sensor OTP, or any other NVMEM provider,
allowing multiple provisioning methods without affecting users.

I also think some level of abstraction should remain in V4L2. While
nvmem-cells can be used to reference the data, the sensor module
attributes should also be definable directly in DT (or ACPI). This
would allow multiple ways of providing the same information behind a
common interface.
Similar to networking, device_get_mac_address() can retrieve the MAC
address either directly from firmware (DT/ACPI) or from an NVMEM cell.
The consumer does not need to care where the data originates.

So in the end, exposing this through a dedicated sysfs attribute sounds
reasonable, perhaps following a model similar to DRM's EDID.

Regards,
Loic


>
> One could put it in a extra partition with the same issues as above and
> a huge technical complexity for use cases like the RaspberryPi.
>
> So the devicetree seems to be a good location for it, just that we're
> lacking a place to put it there.
>
> I hope that makes a bit of sense.
