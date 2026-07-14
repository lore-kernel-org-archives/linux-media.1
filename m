Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5110E3DEFF3
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 07:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013352; cv=none; b=nzAf/yX1L4NClSf+0evQO5wvQgmwlFCOWRQcbi+bVIYm/F33cyJ6GyXjGfViVSGa08h8R+NonLgyoMKys9CPr7nOyQy47sCP4V+DYsyWEwjY+MgWigQdMP8Bj+9ye5D5itkuHUdvrOBGQ0OlYznogOaPHLMh4DJrfVWzi2iDUOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013352; c=relaxed/simple;
	bh=H141Rol/s91YdtYDmDq4sqT8D3wkXMjtdEljbEKZvLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxcWQ8TbaZnmfn/Cuphj8YSfvUG9662WXTSar6O7zIlY7mlvACJMopAkNJHfIHqFbV+9cDofAKaiRM8KJlzxZ1WFRYXFhDixABKUnJUMnnpjivdYYmH5h3Sn+e+t0iLlPjN9/Gd3r8R1viipxKpVgy06ggQvC6MZ4H+L6+YPAKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnJCFSlV; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnJCFSlV"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e9fc3de7ceso1490899a34.1
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 00:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784013350; x=1784618150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M+9VXYQoFKrduQQaI0MXfTWAOznl3U7BNrRUoVoj9CU=;
        b=MnJCFSlVvs/2B6tZ0rS6ZhO3BfKlldXooCTaaUfjTY3FL0s6x7mf3nl+d6km9kwKF4
         ZOoPNDmNkwreVNRF8nrHua4I/hpVL2nzbaIM9HhNUwCQsWRgypg9ncCQKZuPtOMByZBa
         +WLHnDE3EudKPuEavsaBSeZmUNAMQD0PR8LNjQ2Uz2d5qxwy1jvk4na99nRDf5YyxXrW
         nqX3/f8eYW7NGZ7XkmOT0UF0CGiXyUDLK6InZM0UKyChLLSTE22meSwLDDlh0l3WZ9fw
         NwtHnsMMSfAbd6q8u6SlXMaR5yuzMmiNc43h4CJ0f8P23yYu0T8hSYjschtWLHnN/CtT
         QRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013350; x=1784618150;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+9VXYQoFKrduQQaI0MXfTWAOznl3U7BNrRUoVoj9CU=;
        b=ACCDqEbJ58S3sS0bpv17Aw4ibdv5klBCppbCzPSpysobt7QnHv3Rb3UlNHi2U8+ihl
         vudKP+e6OrSRZJcJDYJ00tlrXTZ//y5CW8Ao7L/ZHUOiqf9yMtCi8BfLIWrgjUlhDlE0
         G+bkKNImTSCz2L9FTy4hqDAi0qp6od9cOgcBCJhNH80rP4lgNe+fuNTHBXMAHbMYebcK
         5R7Uhtsh7yWpHyfqz4mvuflx4gZjkRx/zCmKKFEO+VHdT6stJHzy3Y5YsLM9MNA0boqR
         U+bByA6sFbM11ly9qyPbnArKXE8eVAhW0Hj1FMeFo2rlim/EAgAb4BhEg22Ji1NMKTDy
         Jn7g==
X-Forwarded-Encrypted: i=1; AFNElJ8gT2ffNKl+4THKGfbfTQEahmziyncuQqkCpGi6VGDC6ekR+3pk2wht5QKr0XnAz7dTnI/3joe4FbW8lQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCBaPEiV4Z53gdNdXY6yWslW3KnuEoGwGbyKYBzo1fzKMUTgm+
	GcojL3f1YGx+MhomwV8ZZqLuL6/eHtEgdizzxmIug+6YjkZP+QKZTlMi
X-Gm-Gg: AfdE7cmYfo7zCtei6zXM8Rs1xhFhSDenJDJyNHLXCZN+VPgTuZs3tW5d4t4V/NsDt69
	OcMIKWz6yG3Z05lDTQG/N9kb8Ryj0tWuP9+kNM9Hw+/HytH1a9ZTJmz0PmVHpvSIPdmzqDaufmY
	z9Hw+CQW8XOrNyelZcsmlRHMpyuVSQjGPNv4FWfLiO3s35aimr/1Dg2myamkV3JKjpZshuGjxCQ
	gpRhaY4nfmNnR5xPmLL/LcHmWaZ3YGZrt06dOm4hp+cqRoLOhSLq3khdSkbWVGO0bexqH5qvvHV
	Ge0dX9oEUIFk32/m/CAN72HI7fiP17RQtTwYVPx7ePAG3Pcxne4X0BsKdg8FkFjatC24pDFj/iX
	Ka4CbgCOE9qZDKAFX+bfb4F11/vjYlL3ifsn5pidvGKXhwhlAM76vBn4+3zsoDKaEHw4q3ADPZQ
	1nw1To
X-Received: by 2002:a05:6830:6b05:b0:7e9:c481:ff8a with SMTP id 46e09a7af769-7ec096782c6mr8345084a34.11.1784013350259;
        Tue, 14 Jul 2026 00:15:50 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ec14489139sm6778498a34.5.2026.07.14.00.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:15:49 -0700 (PDT)
Date: Tue, 14 Jul 2026 10:15:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alfie Varghese <alfievarghese22@gmail.com>
Cc: neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: meson: vdec: fix advanced concurrency
 and UAF bugs
Message-ID: <alXiIGfZjTeaD7gm@stanley.mountain>
References: <20260713181602.773-1-alfievarghese22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713181602.773-1-alfievarghese22@gmail.com>

Please slow down.  Wait 24 hours between resends.  Otherwise it's like
we are hovering over you watching you work and holding your hand for
the tricky bits.  It is overwhelming for maintainers.

Follow the other v2 rules as well:

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Also say that you are using AI and haven't tested these.

regards,
dan carpenter

