Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA8E304BDA
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 11:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771501736; cv=none; b=ijBLOwqlJKYHYaPJtpL2TgUuh+AiUgQB/jNRDGr4rzRMpSPQSWK4Q/rtjoVllSZXmIA1kqmKAYZridhgHW9IFNqbsNtornxaYm9yedYFE7a58TP5s4/CcWRhhb6liXz8g6Xf8QDgL3ODJOR7cVEZTiobxN0Ez4y5IQe7IDVZrIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771501736; c=relaxed/simple;
	bh=RM0Eu03VswpLUFAYFteC5nx+lC1kqOSODE5iFKN3QHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fOxwZD8M71EU3kLLBqXVe8IfqpdDer9TK9OeVGJbK3OEvfNvUur2PoOOpuavI5mhUJZog6A8QDT8shCOSWhojdqM1PGpici3baM7W5qw1bL42F943GcPrhQxDkut0ihzJ/fxyrGcYE90fUOV/E4aRgTGh9zbxgKhXaJx+jYsT7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jetYnALf; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jetYnALf"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48379a42f76so6729165e9.0
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 03:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771501734; x=1772106534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RM0Eu03VswpLUFAYFteC5nx+lC1kqOSODE5iFKN3QHM=;
        b=jetYnALfE3f7vMg7BCYw6FjjmATsYJnUmhB1mUzy1cRFllg9hnSW/uHkWE1GP3edFr
         aQ/5xTA2yz54bwKqK3GjJiW9xvRgGdygjRkdvnKuPwHAPW1E1NKl3a5clrZMUxd7YCaK
         WtsKnm+fqA+u5K8FjQt1yq9S0PT1EjOnCPHyXyV1XgdQ4NSit0+9Dvid9FCZ3Gw1S+uo
         KtKbauKX3YmN4BPu/WK3XNFwgX6WiRgkS9aEQcoW074VpM9Bmb8MC3G1ZNz7ENtosrpv
         8fI2WQiFheZ4+bdHxpJeYKo+zQQ/EwXEIrq/MipwIjSdYN6e+8TuekcgQl1Jnn6UE53h
         xQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771501734; x=1772106534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RM0Eu03VswpLUFAYFteC5nx+lC1kqOSODE5iFKN3QHM=;
        b=NxTZDUikA6wRihQVbDmZ8JU3PzNgQq4Dgbf/3N/zTl/X5dN0ifoyJ0bKJjJ45pW6B8
         YokUDnfeNEP5mhJjRIF+YxChU18hWrwydTqu82zPFLGExGLDolE768cPy88TpwlB5jWy
         pJCRKpnUWHK04UWAEHZuA5hACTLnmrcPThWD48WU1zcEdmve6ScvkG62WgUkK7fijtlq
         LD2zTaK+UF6W0LGd0sSZzUWtpUe0hl/53QxA9ocYCuTtji03r2qMm8VEWKLomiifT+Td
         O2TApU9C1Lirff94OvMvjEBqcyFvTdViOPhZQtA5aZgp5GbOIt9bBJrRpwcrjGB2WdUc
         vb9w==
X-Forwarded-Encrypted: i=1; AJvYcCWbzJtdA2B40qECHB8Ks3+E0AkZTRTsAWwSNn/J4ZH1BzTxqxYaS002XsY3l/Y51Hzke/Bl6KUYX9VaNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBDWnwsl3Rh80NVZ+Q+rw5pt4Uo0E1PxRzkIXzkfeoK2W6fRAW
	cAPxTcmtwFmkEsxwp/A3iGT3Tt9x8l2TZWc1Sf5yfvdaNFRZqMp13rOw
X-Gm-Gg: AZuq6aLk00GhUQsUc1VjN/kTEjIq89ckQQUlLMqrrfd9lJ86bZjgxYbWFBH6dFOPjpw
	j98JlEomFbnQNSHTvmfw9KGfpOJHuZF1eIJuJqI2UW3dN4AJ4dROEhbWBtQ7UL+IHppeGdF+iXZ
	VOyGqaDopXC707og//NXJGfw2yPlfzXKI0hq8XQ19Rb75Hj+CpijgCQ8QQBOkqQQfHArm+n+idF
	q8bDQHxnYWWfXA5yPFX68K67y091ss4myntVwqG9u2w4v0DXk4CRiIcJu/fBUTTCA+9SWK17QJt
	2ePqPWrB1CdL+psSJpFW97OHY8cBinkv24aoa9DguykJMZksCENpHs920H5/5D+qAQuQ/SLU9yB
	9O2wVYrijWJn4Rz/p2etSL63yMUcabcOkWvBbSDtVf2Wf2roT0FPP0djRigveQAlR3a/aJcshBV
	Ca41n0YmANECp6MupLKu/nf9mgkwKkN6+yZECLD5318jhR1NYMSyHmxYeVe1mZrIZkd1BbAFxxl
	JYreuEvyNF2JJc=
X-Received: by 2002:a05:600c:8209:b0:480:1c85:88bf with SMTP id 5b1f17b1804b1-48379c1f524mr295267145e9.27.1771501733722;
        Thu, 19 Feb 2026 03:48:53 -0800 (PST)
Received: from hamdan-pc.. ([39.34.129.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5b4cdsm52037758f8f.8.2026.02.19.03.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 03:48:53 -0800 (PST)
From: Hamdan Khan <hamdankhan212@gmail.com>
To: hamdankhan212@gmail.com
Cc: andy@kernel.org,
	dave.hansen@linux.intel.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	tony.luck@intel.com
Subject: Re: [PATCH v5] staging: media: atomisp: Fix typos and formatting in headers
Date: Thu, 19 Feb 2026 16:48:48 +0500
Message-ID: <20260219114849.12675-1-hamdankhan212@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209162026.18907-1-hamdankhan212@gmail.com>
References: <20260209162026.18907-1-hamdankhan212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Gentle ping on this patch.
Please let me know if any additional changes are required from my side.

Thanks for your time.

Best regards,
Hamdan Khan
