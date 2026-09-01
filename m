Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9FA37E5F1
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 10:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258737; cv=pass; b=rAXGx4qEwCjE1PXzcXuIueEXOOFzJ10iq1YNkEgtt6q7C+CD7r72SH53Stt35YsLai8BcDmvlGzQ9idxubQKfKCnzmu9+hyawI4EsHs7G6uZyN3UjwGgb0e26Vj9uFLCboDbdP+bsHIPAHG16XSRWaZ6P5e6BNFo0hSC47ddmo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258737; c=relaxed/simple;
	bh=smEifeBMy0Z3ajt+Qik15W/HgNo5+JEeABnfNmNyhfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rGZoyprK8rRHOHxhbQBxXZ9mPKn69d/8X/JiEXKEwFxLnD8LN6yuI9Lyauh9FKnEjEMH8cYKYCluLS3Tn34EVBhNuyYNhI95UnfE1aXrd8aC5xQS8XD08DKInle2icGZZFfVmKbMaiFLixPY62l8udlYoCRHnDzp93KpqqBf4KQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pDo6bGeU; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pDo6bGeU"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so855224a91.0
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 03:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788258736; cv=none;
        d=google.com; s=arc-20260327;
        b=OZp1/3pDnfuhcfUSxbQavzPKqm3NlHySx8mYgr6gioTTCpeCpRkqXaWZDmHrXuhIc+
         cGxRCiRCefYVa9NvbfJo2u7oz2Ojce9AmAJGHkIBWpuDiK6ahe2YYA2O5hl/OphA0il2
         +yrn5PYYtpNkE+qoBU8Wa85OXbOEAEe0Ht1cFoenYdKReQ6nx5qhlKEGrZ5U5UmPYDmL
         zROvY0ji+rBv6OjTB5/SREIMAmVnBPnrm30wXG6eeIc2Nmju27UWX1HJAX8vaQJBWqNF
         PBFIARUl61sEAwb9gya1aCdXyjNrL1dFTKlJJ9ipjwzMJwPJG71ZhfVrBMq8piEopa5Q
         2FaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V5s4IKVXxawyIQN3k+Fx8gYZRs8DqeFSyZO91rnQvKI=;
        fh=Uyk+gSDxDTnG5ZU45FY0nTNFo9o8NjBFLajDOrweZxw=;
        b=dogK+vjnRf2uXRmmUpPc/psawFwKxXYPZfkIIIMAMouPVhbAcwROBaUgIpGt1slFNK
         eV7+Hp9Z1IB31cU4JpspNH9F9Uvb2ggV2K1ZCZEUXjiL3AdQkXCLPElNAYQhyITyryrq
         svNSuE4PbrevfeFpwqvDbcBxPSOW/glmhWce/spdVgVbtYsjDWkOIX0+RlDX1LJtP4Dp
         4iL3v5+4JVxRnVCWhVuA3nc8pzJ2rvSuhEIhzkro19aGIJ2OBJ/DyANsG2nE/WlhkDbV
         jd8yMoOk25BlML/MeQfOsytt/grlMIEsQ5GVEgss0ARdrYphYShhEwzN5Gl+RYUFtZUK
         SnSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788258736; x=1788863536; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5s4IKVXxawyIQN3k+Fx8gYZRs8DqeFSyZO91rnQvKI=;
        b=pDo6bGeUb3RCk5wwYhvyHsi5UlnmlmsB/mv8gFGgXdUeHqXJV1gsRmBfisgjrE/V7Z
         0YaGgb6vBv9XLZ9efNdrNzi2qNPQkxwjUJ3DUljRI2qo/KBTAOgCMWm6rxxgryr9o6s/
         O4xjNeS+VMhqrEc3Y8sIB2mnjikHoixUfuyVmGoFqrVAtpLgBtNn+MFgmT99EIwbNGFs
         Ye+almjLq+zkV9g80wI/9zavhxLgRV7o451199agXf0OLENDOoLIL34O4zjxXUchxMWN
         K+axDXkiHp6ZX7EVbzWwutWs/lPUj8Edmx2+Q+U+X6U7yZ4gzGywCiud7BabHDD/aQLj
         Sb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788258736; x=1788863536;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V5s4IKVXxawyIQN3k+Fx8gYZRs8DqeFSyZO91rnQvKI=;
        b=kWHYgrGu5YvbzQMxJaXDzsEHHw//l9WRlUXaGcaMFEZo0FXteIYdRBv3b7mPbApb7H
         zUhcSfkGMPg3M2RoqUFymvRc+nLB5pRvECbh8hjbJQBeB/3D3439yGAteXkELbqWX5Oj
         7RRWqdF6icwoykCEI8qalWsBQsIfj/mh8oTBNgTFtVVDbC9ti+47BhUL9pyiLDFgxhYB
         6URiCCm2O9APMwy1JtOKYrprMvWEHbDoIT5mwG/tKDDblLUjCB8qqWytk83oT2CJ1j4K
         FQhJRhYq1hii9CAZVbYd3WyMsuwM3D/msxete4zTHfsWin2eaQr/PNODTWLh3ryl5Gkb
         HBpw==
X-Gm-Message-State: AFuF++mT3MC9wQ+hDwHbvgYIeePWS+ATNw4ydKkJ/qEA7j18nHQVR7UL
	a3SbEKDIojOYwN8JbPTSrO3m6K5BL3RzR2Be4a7URFSWrUx8L0ZrygQQuAqK1TuhZqhL+EPxEC4
	jMswaavQVy/c6qiJKABdNLM0WmML9i/M=
X-Gm-Gg: AYBFou3e5eB8du9vaJmea1yaqvuRDokHfhauPMNPzvCrTmu9EsBfmSB+qPIhv8tgNlt
	tIlJN0GlLuh3y36ujUOY61orhW34igTIedN087uUDx9FQnz7dVcehJp9Tr7nbspaFNTarARv2YS
	B/Xh5y/PnotCWVfwbE+JhkNMOKMqwYT8Z1GouJra1vaNZlGFXNk9kq6hjNGbF5+pfDceFB1YB2x
	mN/qy85X81lI/7VAE2frcE6Jjo/vgjNqeNjTScMiDEgpsweWoklwuT7uL3vzRMroEYElWnNyRsB
	/Xyn1no4vgi3GRm+H2u517bPGiNXl4L8PF3eyc6HTjqd
X-Received: by 2002:a17:90b:4b91:b0:398:9beb:a2bc with SMTP id
 98e67ed59e1d1-3990f91f621mr4597404a91.30.1788258735750; Tue, 01 Sep 2026
 03:32:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820075524.2056029-1-eagle.alexander923@gmail.com>
 <20260820075524.2056029-2-eagle.alexander923@gmail.com> <20260827-legendary-viridian-tamarin-4e56e5@quoll>
 <CAP1tNvSg4yWHCJW6UNZ4yQv5FCjz9u5ZLpuW5Z9skkjQYbS9AA@mail.gmail.com> <21dec355-0cd7-4250-a7f4-e93f3e446504@kernel.org>
In-Reply-To: <21dec355-0cd7-4250-a7f4-e93f3e446504@kernel.org>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Tue, 1 Sep 2026 13:32:04 +0300
X-Gm-Features: AcwNN1V92jXDafPZZtSS49uqIzVTNJkSWZ4fOedgWAlAqiYSgU8_CRCjPwq9NOE
Message-ID: <CAP1tNvT2+uNvcHf9=c_ysaM=gKrnz+5ZMTOq-8n_V+Ryx=yxLA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add onsemi AR0234 image
 sensor binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Quentin Freimanis <quentin@q-lab.dev>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

Hello.

> >> On Thu, Aug 20, 2026 at 10:55:23AM +0300, Alexander Shiyan wrote:
> >>> Add devicetree binding for the onsemi AR0234 CMOS image sensor.
> >>> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
...
> >>> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> > ...
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - onnn,ar0234cssc
> >>> +      - onnn,ar0234cssm
> >>> +      - onnn,ar0234cs
> >>> +    description:
> >>> +      The AR0234 sensor exists in two different models, a colour variant
> >>> +      (AR0234CSSC) and a monochrome variant (AR0234CSSM). The device exposes
> >>> +      the model through registers, allowing for auto-detection with a common
> >>> +      "onnn,ar0234cs" compatible string.
> >>
> >> So all devices are compatible? Then why compatibility is not expressed?
> >> What are the actual programming differences between sc, sm and "none"
> >> variants?
> >
> > Perhaps I need to revert to the compatibility strings that were used
> > in version 2
> > (https://patchwork.kernel.org/project/linux-media/patch/20260807102847.1813059-2-eagle.alexander923@gmail.com/).
> >
> > From a programming standpoint, it makes almost no difference which
> > sensor is used
> > - the only differences are in the output format and the format count.
> > Either way, the driver always uses the sensor model determined via
> > register reads.
> > If the specified type does not match the detected one, only a warning
> > will be printed.
>
> Devices should be made compatible with the fallback or even the color
> and mono variants could be dropped. That depends on the difference
> between color/mono.

Removing the separation would result in a regression.
The addition of the color and mono variants was proposed by Dave
Stevenson following
the first RFC version of the patch.
Subsequently, Laurent Pinchart suggested an implementation approach,
which was indeed adopted, though it has evolved somewhat into its current form.

Thanks!
