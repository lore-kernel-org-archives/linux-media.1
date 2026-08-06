Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90BF37F012
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 13:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024727; cv=none; b=LY073xwwSGKK3LYzDrFeavUvc6kp7YYNnMIVi57ibS6iigPneFZNkGb6anjr9Owsy09jJYd2a5tuzWgHJE+DgIuhKbLkLwqjs5xpvIYuRLsAQN5Z4NCMZoKwBMkxDpGwRxV7qY4YzUDbaupSaV10GPqv3ljHaxN1rFbV5AEVf2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024727; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=ckQX80D+kxsz5v+MeOWEAQb1d9ka3dS+PR/aXPaS5qM4o2jqCJvV8gmvFswMwue7glky4kPt4jBXqFHPug309hKjy62iPBHz6i/WCaniyQsEKzUZowaReCQrZztpVRJu7wBlIrlV9OX9+qjV4NxRo2lvkpmr8pzowkhkCO3/tys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THkOZtzn; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THkOZtzn"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-59cd803792aso1464045e0c.3
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 06:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786024725; x=1786629525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=THkOZtznsG53SzsxbSLJHTHKCD3kz0VPmU8bkj6YcUDHOSUi/KJX8SG5ICGNibHLnj
         pA/Ou/Pcfho+2+O5H39GgdDFqommo2FL3TfIBnGoW9rSuAbNRMLsCGLNV3z1mPK0KgLz
         1VcGFefGvA7GEdlPnKu13+4Ebm+i9Nr3IgAUvTld4i18wuq6nvbHz5mYKrVblEkrIred
         eVnxcsbYlt93cW2A+Ms8M36vX7R0ntJYGZ2rLYqmXeqw3/EK2QfDnYrLFphaIw/ebRx4
         R4eOEll16P4hkwsyGuZHWLh8Ra2s9w3U5yLRgHuHBTxIIcGN15QIPF2+n9dtzF+Q0373
         gepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786024725; x=1786629525;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=I4ithNvJL0hUWrxVJ/bfFfRh05PvJuHZt8XDPs3vdCayOJU6rSGWpfeWfXt6IYm9DC
         mCcGMqln2U8hGmXzc7rcokImXR9scaoUxKpez0roDCDO70fAD7S7os+JeRQtQoTdQVQL
         +2BF06sOR0ESGtJEnLy5Fxfmrm9u2ArSneoXT9TIRaJsUkIzqWff5maee9jWJzzqs5JZ
         ORyIhkCvbP9uNVj7eTDIAzRgTTZSlt7UwZJ4VGXZQhumd9dKhRsfyCNx0LZmkWzRvLPc
         3dM4mIapiBO9wNlo9qcID2PsaA3MwfNZRPvky0P7nKnFRlhCZQpG+RSKZiR/lUht/QRn
         Adrw==
X-Gm-Message-State: AOJu0YwhwtI17Da60mKaOEo/Z94PlzA/Ja6U2kagHI6F2Z665ePPJ92H
	eo/tCqW5cx6NoJKvc0ZQ1w02Rn0ov/cU+kpH1uiFCBbsaNpF66XRDx2yJ/Rm7A==
X-Gm-Gg: AR+sD11GvCZsGN8TfzUKex7A8YsCx9P8XNvHerV5CBSJqreY2ePL0/ceU1HJYZVdWFZ
	bjjxvHs+QRNDomOvhRLDlCQzMrlCrD8488sD+D1g7+Mmx8hy5PGpIM5piH+T36az6aBQ6iDV21I
	hK5rnQoYB8WQfJQn3I4upyAjWNYHWH9E/sVq7MFItZXYWWRlnqBWb15XzLfWYmOKVI5BAoXDeZa
	Y6ppmy9iQ7p0J9raAozKT+rV0aQEb5eLHAQyof1k8JzMfoBaiPilsOsxtq64PCMfqolV2eywV1k
	dCNcC0AaN0MeeKxGg02zN+s9taUsvTUig2/+xs5RED+f/8YOi1/Mj5fpwhlWMh9zNF80ulQXeGV
	VkoWKxcS2KXgZ3raWDV4cy6n8cTCrmxUSjPptqB3Yb34DPsXunIkln7+SxoSlvYLwhhpkrN/YEi
	9BA3errNY803Pc7FBsdHWC6bP3jOOJb9adgWaoBg3wPKelp4w/qRwmCq6EWlMpJpTpeKJK3mqZV
	XmWPLIkvOONcZyL3QQL
X-Received: by 2002:a05:6122:278e:b0:5bd:71cf:e97e with SMTP id 71dfb90a1353d-5c3d91171f5mr2272837e0c.5.1786024724601;
        Thu, 06 Aug 2026 06:58:44 -0700 (PDT)
Received: from [192.168.1.200] ([95.138.85.237])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c3d05c594fsm3344668e0c.8.2026.08.06.06.58.43
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 06:58:43 -0700 (PDT)
Message-ID: <3ad9859f-017b-416c-99a3-b278fcc2aad3@gmail.com>
Date: Thu, 6 Aug 2026 09:58:42 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Emmanuel ALLAUD <eallaud@gmail.com>
Subject: unsubscribe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


