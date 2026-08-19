Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C125D2BFC7B
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 21:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787175194; cv=pass; b=puLz0h4N0K81hM54U/bYQRtuRWFOlyGwSAnx0K4ReGYdG0+1Rcmox/DjGDwWFRt4aU4Y3kdiHeRin+oPgkc5OaCDhvT3DLTTJ9OqgBx3eoP6cwRlnQmz/Sxrn19wQRIbyz/tsaybIKWeoM1qXuPsEi36xzXMQt1vFvqOR0l1xTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787175194; c=relaxed/simple;
	bh=0yuQiTtflkY/YAVo5ipfAt9RToVOI1Q74XMibElEASQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CnBjPPVqsYpVI3O/SfJrlUItNr1xHWBKoam00+bmSpFZ97hTKv84+5KME9RwDRDsouW+Sa8VUUiGVMsKmeABKsSttkouwWN2huMGYPwpsGYPP34I9wi5w7K1X75BqbF+v3BL7DLXKfPSCOjY0X1jTuVr4/Q/PcHg7zKGE62Fi0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxKML53a; arc=pass smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxKML53a"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso1747484a34.3
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 14:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787175191; cv=none;
        d=google.com; s=arc-20260327;
        b=K+nmOMfryoXQ9Dts/08a7M4dG+Ls+kN1CkxkGGmGMMEMD6kpREJgdZ8FFicDd8g77U
         RxUT9MIZZVyGOtOTJ7L1EfAqQiIqF8gkp4ltXrr9r6D5YNjTz6Oy0Mr2y0TE5Vf1u3Yq
         cyHZxI8NevjtEGQ4zuH0bGHbM/hwPxID/397kjX3MX/sEPGpZN6dGfFrr7FGbEB8vFb3
         JNizNBdwXoq9ZIhw5u/zD/HhISu1jM1O0SWNlg+7BazG2DRhQo/BttQOQ0hJlVw/BevD
         3Usqvo30lxVuI0HZ83K42/Lwx9cg/f17VGVz0Z0e2gjBIzfr7OT/TLpga2eChFG2Qzcb
         rC2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gx2FaQwosf6l9TDjg935G3BICKMlJHtJrPTe2w1aBGk=;
        fh=lNR+cdyG0Bo74z+nX05b8O1zHrClAeCuL9uQeMPHkQM=;
        b=Bd7t171uowDb3d8SYW0VWbLtwNVMicoDYjdy35AKJDupgeZugQVFIPFAcDzlDZCdaI
         YQz39LFTIv+yr0iWYQWwTlnUnU8WiObuRngEjT+EmvD9wEYr7lXrmyW8OvUlGeKqJ7mE
         7p9nxjC6B6x3ASFTZdT0Vdto42dL7IiPdrwpD2Qjn5NCPwJpNR1+Q8IrymV4wt5yMlUu
         F4LFHjW6TSRB44iRgdJGTZhKr8VEiGZwqbrVWadkIhtpVZ7LN1CUvyh3RuWag/QLPqeg
         2JVT75qrUu8DRiWSfda3ZH63QyNPdtERd87wd1ZP0HoAA1xVWRGp4GMG4qJmZia3HRD+
         8ojg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787175191; x=1787779991; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx2FaQwosf6l9TDjg935G3BICKMlJHtJrPTe2w1aBGk=;
        b=lxKML53aLPuhxb2t8kolIm5WWEv5xumqH9H8lPg1Ws4Ovb6TNIF9FUswmirvLUUvi7
         gRn70XtB7VTSxXnk5hOwFVDNXE+TXjkPNHbIyzQBWubjnWfMwFFRAr0Gkn0zw2jBk4tz
         GSixoA6eCT7Y8Rm9+OcBA0ETY188k5JE6dZfT/J/pKF9bGTtw1UIlEZtb58GwcHSOuPn
         dVUVZnjT+QNyQPwxiqAZyDD0DUXIjMwSTHiIWsRTOTtEtTwCvKmPN0Lr8pswKUcFg6ID
         c23ewvnEivrrFWLRLNv10LoB0GUYI5ch0VJug2H79QJ2ttqRoUMu9pSZmsKn5V3qaaKp
         sU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787175191; x=1787779991;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gx2FaQwosf6l9TDjg935G3BICKMlJHtJrPTe2w1aBGk=;
        b=aEWMMWhZWuNOy+yLcJKgkrs110VQ9/O7BI0YrEmBG1cTukzRvd6/FctQZpAV6Hyzel
         kU2+/TPuE03jO9TOTggq7eVE4ivpO9YVmxfz5HSdzKZUiKbZNhX2YMVVefcpwO6misr0
         Xw9plPkpRn1jFw6iTN5vtilOVxJTU5HQoSmKSueHX+udpRzl+g0XWQh4hjbz0cz/MRAc
         6hGqZ1mtIPKnCChbaqzabqV+zPbL4451NFpzLadxVPNcvV6Ds7U10YXoEYJJu+wgjZ8n
         OsSJ7rpUkwO1fVk8oUBfVwcD0Le6erxCuYW45lfEohQro4BVgxEYss04JCf2a1/ujM4t
         e5Og==
X-Forwarded-Encrypted: i=1; AHgh+Rqrho3a0/ijOdQnEaPYULseNMDql8rXBjhwvAL1yfXD+2gGt/zwnZ2RjroWZ37O93s991b1IHQjK3YYlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwX/E8JFoOD9+zALEQSK5lP87cLFAvvhwSRtIe4QJ1GTTeWpQF0
	Jdljs61TrVSX16lAZIpqAPV9Z85Q9viVAdlwBMvBX7c6EVPLN4k5l8pvY459MbZg3fKsL3G5GXA
	4ocnxlMJvAXPQwA81S/ygj3mpZMyAYKE=
X-Gm-Gg: AR+sD11P/zCTNBRd3wG6jaOvrVJflpNWWEYxwAigfvolL2+qqkRxT7y9NXH3p/L+KaH
	FbAs3h628dKUYU/oO+/odkheUYPG2btlpJP+rNGbWIz0wivLq9Bk1Puo+OzPraUOur4ERAO4xTU
	UujVEa5QCbEiajxMZGgs5PU5+1wApyAeyMIMRRHOb+3n1c1oOYQET4BJlXJeZGdhCrrbT9peCP8
	914MY01UWd+Vno809hInF5v4ajtHxaKHsWyYrU7ZJVWtKGpd/i1W6hMO9deeYstqP8KzqNv3Gf/
	6cUxneUUC+wPPt9BVqSc1wEQorO9MGhqQqw1RZ6kIB64SkfP4br5cRRPy96DWKtbOwgn/veDBmY
	=
X-Received: by 2002:a05:6820:a09:b0:6aa:e70f:301e with SMTP id
 006d021491bc7-6b13c32f644mr7794601eaf.8.1787175191390; Wed, 19 Aug 2026
 14:33:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818105642.65381-1-devnexen@gmail.com> <aoXC2xL-J21mcxW9@zed>
In-Reply-To: <aoXC2xL-J21mcxW9@zed>
From: David CARLIER <devnexen@gmail.com>
Date: Wed, 19 Aug 2026 22:32:59 +0100
X-Gm-Features: AcwNN1W5zcg_-tTwF3YLwQ8dh2q7T81Rk5bauiLW9pzbMrBtNue3gCWN0-vjtsE
Message-ID: <CA+XhMqzZqLFeDfNLxmXUTpc_FauD9C2odaSQb9HfWxKMmpf6Sw@mail.gmail.com>
Subject: Re: [PATCH v2] media: v4l2-isp: reject zero-sized parameter blocks
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Riesch <michael.riesch@collabora.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, stable@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jacopo,

On Wed, Aug 19, 2026 at 04:56:33PM +0200, Jacopo Mondi wrote:
> shouldn't we refuse the whole parameters buffer right away instead of
> ignoring the 'type' block ?

Yes, let's do that. It costs nothing either: with the header size check
the walk always makes progress, so skipping is no longer needed to avoid
the stall.

v3 keeps that check and replaces the skip with:

      info = &type_info[block->type];
      if (!info->size) {
              dev_dbg(dev, "Unsupported block type %u at offset %zu\n",
                      block->type, block_offset);
              return -EINVAL;
      }

which also leaves the rest of the loop unindented.

Cheers.
