Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122A6386450
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 19:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452428; cv=pass; b=fZH5RyE6UatOIzZqcIw/G0bMBUQqO2tKJAjNU/LSLG98LIcCUH6+JIazIMy9ORU/TE+BXPdDE6dfJ8rCcWMBHzBjJwvLtQVlatTWNHfZ2Y9vzOBfYwwN6JqzXXOZwRrjFtOLwWNGGURmEHFDU3gRYax4NadD9ItCJRVlSR0i6vw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452428; c=relaxed/simple;
	bh=UgcC0RVl6Nt6QPS0xW3BWvWsGBqEPSdHq4xCHzzbh+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ok4zsrsGs5qhUElA032DLnrcv6gbiU86bef5MwXnPc6EauVMd0EKoJz6PhuF0zu79ACfrwc99uawdZ68md42Bs2myRwY8KriSKq/3yHlRY6dfZVvBQMgFxc/9HkQkOS9ncSiOgejaWs3ylt1m43iI6XfDgBl/Af+G1uivvq8ui4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=rg1f4eXd; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="rg1f4eXd"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caf4496889so7468925ad.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 12:27:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783452426; cv=none;
        d=google.com; s=arc-20260327;
        b=JLefgIq98uQsmNdcLXRiMYgBDJuPOd106hcdIjzJ4ecWlTV4uAGjgWjdpp7TYrxyIL
         dPpJZl8uQ4kDrl39YCYir2MhohjuIUqSKEfR/yTvPlxZJPCutCsU8M70whj314A4jLxP
         KIUHHTwWH3flUBxDdXvtcjAc1MAYzAyniobVt516VPeu8lTDW4/mAYsDFQJpZqlPY7te
         mtzo0JdjAWoFqehEWNqTX766aMGarXMG7DKyM/d/7M7m8Qog9WMCjQECOM28PxEep70Q
         N1q22x7HbBMZYYAWPUyY0q9E2wUekFOXh1WqexguEovXwsnKsNavO/CCo8M1a/zaT+us
         h3CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UgcC0RVl6Nt6QPS0xW3BWvWsGBqEPSdHq4xCHzzbh+E=;
        fh=V6pt9Z3LUYDg/iVYeQjak6bx/M9FWJ+6XxnJVu3e81E=;
        b=Q6SR63OeTDwTDpTtTdPS/fCP9Esvq1X1X2NTEfRFz+di9wQISXwE6lRlk68W3P73PO
         nC9cu0wJg3gc7kAhJ8/r8jNu+Zv/tthhwB1LjHxAYxfwAeypGplhYyeHZNIXJgq62xuh
         OMF/WoD2zkwGje+OovSSKSPHPf3Dn2ywKeY9cVKRVak9XhE5tS8TxOu5E9xSsM4tqsGV
         8pzTsqj4qUROOXwjDtCBw8opZvLYF+I8NvkSwVg8XLTVwta9fQKquemLaQnvI1xPXLej
         wE+sYn1gHeNWDLmi+mS0nzLaIt/NM9Fid1pSaHI/XfJsWWjiGSPlhgTSz69E20rH72Pr
         UsNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783452426; x=1784057226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UgcC0RVl6Nt6QPS0xW3BWvWsGBqEPSdHq4xCHzzbh+E=;
        b=rg1f4eXdlOT6xBWH+NPQFpIyyo9QEqiBRdZk9OVeWPmcPCixPs49zvnsx5X8Tx5GIl
         UrI3rpT5vJ8iosXLyKN14GFZ3WMCgmpMAUsNYbfdHjv4XRk4+MKGIBcl9i1b/MxwdKzY
         daiyOC7hO28k9NpIiwUQkMSdm9F1u1ETWtYN0GMz1g3UVNAwQez4dzyzgeqSogiIqZXY
         cjPhYL30PnAaZJztKE8wEail7tAunHQJJU8+iT3DheQxHYT3z2P+Ye0jGs3eTXRaLc91
         wkq/LPm80l1/lIYRRDW/2kH09LS1AAoIiS7V2h8GWeye0OaDKpYUMb8+/RgB8eWj+GEi
         D1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452426; x=1784057226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgcC0RVl6Nt6QPS0xW3BWvWsGBqEPSdHq4xCHzzbh+E=;
        b=WYT+ccOk19hUPrxyoiIBLVK1oDNo6z3ihtd+CafrNAVNtP8V6llIroeYjb4gtSI9Vt
         4Cw/Gt7bPiKBSn9Tmp3LilRGuL24kzFl3VNFF/rB5d1ULOBo31bo1E9XcDvwDmAyoCmq
         kRz+G2QwkIX7NAaxWDRlXl3rsCiacrIu1FtTonHt73Lwxam024bDJUcsSCPSd4+UYkq3
         YqpUlBy0PTAeYERcWZVwS5U2yqmIlKCWR0RFnT2pMyggjYNRXA528L6tzv7/jawwPddS
         fzjvRrChTXsRIHF/wxDLtMW7xFOuT8zCsN2YPy0JiN98r+k8ba8tmZuTgaWUkm/rWJJH
         IqUg==
X-Forwarded-Encrypted: i=1; AHgh+Rpd+juD+QCvB40nMeVaFByffmHVxvvZPosMd5RN5VwGGn5JRiTfLjNB2yQHM9XI4za8b1BCjIdoNb82Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxFijx6yQCRSRkP7RjRdJfsYyQK1iMdtUupzG1d/5fbXDCJITs
	LTso9py6U0JfzdQLy8sKiiZbXTROj5jRsVIxEEdMujCNgqHts8IEgyKBwPt6irB2PeX25tVEqGJ
	T9uw8cLYmJe+LJnWYPAsC9mziJWRpXVA=
X-Gm-Gg: AfdE7cl0uNdcpE/yFJxFnM4vkLK8jBnCUQ85sotL6guS30CL9SJ070JKljOxgmfckY5
	pmed/JbzYV78KbsZ3xs0yokFWqKa4r8eS5iSEptTQFK6rtfSYy/nl28ITbHalSfe4RsduiXyScc
	RMMNprSbfFOW2VLhkYpTujtSjArY2KysQd6TKHuhc+1XLu0HlKbQVuHGFbPOO/EN0UdzICxJcf3
	AbTJpjaR8W8jtMvvu1dXDvoPZX8jsNaWZc8RncCqmRqg6CWr52+sUeb0Q3muPNKGKWclJtYpRSZ
	m8p2ESF+Bso0jZfqsa0wGN2Hsw==
X-Received: by 2002:a17:902:e885:b0:2cc:841d:cd7e with SMTP id
 d9443c01a7336-2cccad9693fmr37869045ad.21.1783452426303; Tue, 07 Jul 2026
 12:27:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com> <20260706-a9-ir-v1-1-4f082ca8aaf1@amlogic.com>
In-Reply-To: <20260706-a9-ir-v1-1-4f082ca8aaf1@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:26:54 +0200
X-Gm-Features: AVVi8Cc4p_QHwDWk0aEYAh_2ulyl2XezrYxvB4AQz2uBN1snV01ZmTjZPjn_E3M
Message-ID: <CAFBinCCv-pUivmW4_O5veamSQBApmTvbyGSrOBr14tsg4yf8bQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: meson6-ir: Add Amlogic A9 IR compatible
To: xianwei.zhao@amlogic.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 4:43=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Document the Amlogic A9 IR controller compatible string. The A9 IR
> controller shares the same implementation as the Meson S4 IR block,
> so add "amlogic,a9-ir" with "amlogic,meson-s4-ir" as the fallback
> compatible.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
