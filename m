Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5326B4D2EF6
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 14:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162548; cv=none; b=XXnrhQstVVe4RbXEbnjDzH38UP+hueiMxaEj9bHIdw4Wzb9igm7/lhqwprBeJ6kuCxd6+VlXoHteiZJ2yozqRQuykqXQ52IDYLhLLMr8glzJQ/Sm5eSWSyoaH/5PgqGaPXmTST8LySqzeBHHCkWXPSHdlAuEnVTQj/Ls64FWh1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162548; c=relaxed/simple;
	bh=uEADsI3C+ZwQjfzZOiQYNESNHr6nsHl6ctBrdOBDmR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MXAvDgAvFWnRCB6lEtTA7kN6PLptjdLwZXhnJ5G9rj3yuHbFOC7YuqwJcspHHjn3UryzJSuFEUw0s1X/X8Z5afEvt15fI+q9UcExcc8H3UVbKkhz2Ch70aiHm2+S38/l8HB1DQtAPTGIw7DnrQ3qvqjOYqAb2vDnyohAA1OUURg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3rBpaFv; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3rBpaFv"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so836381f8f.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 07:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792162544; x=1792767344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uEADsI3C+ZwQjfzZOiQYNESNHr6nsHl6ctBrdOBDmR0=;
        b=M3rBpaFvAPekf8pwFqOZvYYbOLLce3tuJy6//0GK+YIK1K19LHF7OBBF1mMFfVivMG
         G+r5sY9GKnABXhpbYh4PS8nQIUuimsEfLX2rUrc8f8s+MbAI0QMd+cNYx1hqyrw5u1NJ
         SHhhVP1l9FHLyX8RSzWBhpVI0DkKv6YT2QuuWkfZgJ6BhhCeNTyIDplAMlqwGMFvo3Vy
         vQJP4psJh+oP6RQa5YinbRRy7z7CtK2fC1nSDIscZq9lF2Aw45jjjCb9FI16zNksKQZQ
         tzKmCFRccsgHGEg+ed52t2MEaWRTnoRPshA9ncA4+rZNngLdUiFhTmKYfGY+7KcLqfS1
         +7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162544; x=1792767344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uEADsI3C+ZwQjfzZOiQYNESNHr6nsHl6ctBrdOBDmR0=;
        b=vKCJXeBVGZDJLmYWXtStAkAVSP8F517oI+JHRMhTrfwm8ToEG6qonGAlYdVm8sF4Mu
         ktP7eBTPrwwKlzgkKteg34QMyPgUd2HnJDTlrZkd7uWvSCy1X+i6lAEUBEAphB6Sjk1C
         UUg4YNO/xmAClr/3B/r/1caqBQIMbfX2RPepR5z/SrNnQZKhnNh0w1zkjNFV+zxBv/Nt
         hdGKsRu39NqQgBWqthNSE9ZNvsHkUMA9pL2tBMNnjUR5JyTXS8ifDoLgvLskodu741/b
         WGZhnIONEmSJi6i7bxyXytx+z4ntNicUiIcOw4PVop8570d4E0cNI0dxuNG5kZ3WFPwm
         rviw==
X-Forwarded-Encrypted: i=1; AKwUvBy5KUe9O8z3YRHoYyqWs6xM+hYwvagaQrF3pAjAUlF0fZhAxYZnEDJUnujD1oqHVLAG0AEA58qQiRw99A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJJO/vnDr24yf/D+QOJxfooN9Vmrev0vaYZzXlk8cOds5qvu+Pt
	+9ETQfHRayfuLBvv91+BGwIJKZfll23LRGp36vSAH3318sRNjtD3ko1y6gHUB9Ja
X-Gm-Gg: AYBFou3pG8H9R6PONbFGqswrwa8mMx0son3VkEnEyfdGHpqJgaACW+Rmqls88xNaV+e
	QlrMZU2qcVnBvJk7Va3r4/HVnwaZL7taMNg3BQDSfC7wHEvxF/K6+vZRKvuM8ufyy/USY2KiQ3G
	qXgioX/T/qJH13FEhImb6HV1iJR2fdghALo0hVW55U5zdiwqxRr7RBFdn3Pe5uZ7EAzPF6skFrE
	h+Ys/dD1oElAMGRkLyZ898hP4+wnoR66ZUZIKXwZd2RWP/s89j5gD7GRO4u3yqb7NRpcyj63Szb
	aBmHaI2AWaEeU5XqgDtKoxIvC4hWL84JRPQUYEB7hJ5GLBbGAKrBvGWOTegFvJkLOP7uxBeLqT7
	HWzpE0SOnxRQJG/zJ4pePipp8BQP9dkvPkf5XZ7coAF3hCoQNWh08fu3ExqxGs5alzMOyI5Y3Cp
	bkyi2UadZLzFb/9O9ghDBe2t4Q7errynHayXKh+yFM6+maVKkLei77kTfShBvS381XdrgEuNWIl
	vUMBGLheTJ8qLKt0rCavHI68ZKa7076XThhWBN4X7tt8DWOcbST51D52EH6FLYPSWsIJpNC
X-Received: by 2002:a05:6000:290f:b0:48d:f99d:a0d3 with SMTP id ffacd0b85a97d-48df99da6f5mr8407928f8f.46.1792162544436;
        Fri, 16 Oct 2026 07:55:44 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8bb6sm5918002f8f.34.2026.10.16.07.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:55:43 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Peter Marshall <pm@petermarshall.ca>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: vd55g1: Register as a sensor sub-device
Date: Fri, 16 Oct 2026 15:55:42 +0100
Message-ID: <20261016145542.37322-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <073e5fa2-313d-4d7b-ac10-3a74c57d3c62@foss.st.com>
References: <20261016-vd55g1-async-sensor-v1-1-cd72f6d68ea4@gmail.com> <073e5fa2-313d-4d7b-ac10-3a74c57d3c62@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Benjamin,

On 16/10/2026 12:04, Benjamin Mugnier wrote:
> Signed-off-by: Benjamin Mugnier <benjamin.mgunier@foss.st.com>

Thank you for looking at it. Did you mean Reviewed-by or Acked-by here?
The address in the tag also reads "mgunier" rather than "mugnier", so
the tools would pick it up as written.

Thanks,
George
