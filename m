Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE69F3A9D9D
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 06:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662099; cv=none; b=TfUcGTk0zdGFCorvvkNBn4xRDXVe6wTmGDf6x398o/Hmrx1KdyubBpjMcssej+kiqKtKSpYMZJWxWPfZQKIDob73JnhVj3vPVBL0tCyxP+b/3voFVMv5zeImCYkvUPe4O4AxJc40ILDRSMqTYPN3a5kWxxjROHTk69NZiE5HTx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662099; c=relaxed/simple;
	bh=+1nqsj9H5H4eMiTYvWq+JgqtS1aF4n2hF5KzkhNqrNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aLKhSSnjxWWU1CB3DJMsGSKUyqNIzqSfgXk6x/KvOH7fRmzdh+VXncL2vQPKHH8YlcsSNMJTYoqMW0eiwzXibb1Bc6L84Sf7VrKYQJC4NUxZyQgAlKQkwQfqHwrCwxzFsjEBQq7tse/Z7dSFkeRKUtaZztuHZLlN4pZ/7RC+Or0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfF/vB3P; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfF/vB3P"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4888129c46eso2059261f8f.1
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 23:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662096; x=1791266896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1nqsj9H5H4eMiTYvWq+JgqtS1aF4n2hF5KzkhNqrNs=;
        b=PfF/vB3PsaqBiP0y34Ge1tW8aV6tyaFdRiDCypoQ7+66zw5HsfnJ3eaA2EU2tlrwk1
         JSFas8nIPkhSfbQMy2hPjw67Q5l+5BJRVvHDyNLobk7xceFMcRZcUh9athkHacUUplCS
         nuKWblCHa16mghi5xkwEvbiWfKluuq2g/ni7eykoqOuR7F5nyragm12ZCLg5OXUjuO4M
         2/JIoBip5DwDsNrZxsd4HW9O5e1z0JHFsmpoBZlB88Tv/5aauxFOqIsEHhFG4mDVMNuk
         FQHEa5MM2NM/M0Q7x62iFbPsIE5oYRqf87LbtzhEAGzRHOcokW6sLQLbcrkH9DIPuIUU
         zfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662096; x=1791266896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+1nqsj9H5H4eMiTYvWq+JgqtS1aF4n2hF5KzkhNqrNs=;
        b=ejcOK5P1PetvprxUVCF4Bi32fEFjU4T7Yw2hXUfUEyrFnZjmjDceJ0jv+8HH0JqDL5
         V/oa3ZMvyZEJ34Vq9SNVeCqPlsKlXsyY0qIJhITAxv6GeqcCV3xoA4u7FZh2BmtRvrvo
         o3Dv2UdSZ/xmF0JADrxhiLuCnU2htDwkJQwZWaJLZVFgFqNMML5GqCNRDwnxuNnd6y94
         3kIHyQZYqzgBNXp9LySWbnSuRjhRIyBPVDdR1bP0g7Unsf3MV9rvAARs28kTAo3aroec
         SAjwWurz0Od1dTO4P7UaYDxmti4FeqAeETbMBq4a/DUl5VdpyppKEf78Ccj/cv0xfdTC
         BMxw==
X-Forwarded-Encrypted: i=1; AKwUvBzGXpjkDQRO0f/tXIacntt5xeFEgJY210xyjz42lwyx8/E2Wlukv+m2wg5olgeGO8jLfolio3R0tDVPsw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJliuftT5m7cAurgprEFiD1ZpFzMiCVA2d9puOwGmd2BYRoj7MQ
	/LoW/+BrvdOLusfCY5PaXyn1Qw87xKQd89Fw5cigWFhwa1jUIHSVXruA
X-Gm-Gg: AYBFou2TTnd8OqbvRxZhSrjEuiUmcE8OEt2KSHe+3HGmfvsp8FqNlOrb7U4gzf6GqX7
	1XcAWmBXIw084vpixqOR+njiXd3aezxdaO30WlHriqpPxxYxjXcDuKEKRlnff0BT+gWxq0WqcE0
	7dweIJ81XtUtHQzxN9GiZqSl3PsReGI7OrDoJNMnez5R+P6UpwgK8Ln5FWiY6vlSjMqiLAFeMw6
	xAU/t3vFMx3aWPWV0q0cxww0/BugOZXF2PCjFa1C+Ld/5C9IRu4gYQL00yMXBmshcBMeiUFc4ZZ
	OIssFEIFSFy/vX2stOf/UOc0e9WQmMdHR3jkLdgbeZpgjYXC6XgDzXhnSsjzcDcdOhMrj9cn38s
	OiJq6k5Czr/P/K1jT7rdqmsB5tGhGgXB1TOHO7oTQoBbEn1Z9IwO5gzHKm0FI617vUt01gzdAzU
	n+1bdDCwQ6/5QHYVLSqAHUXzjI+UfRLzphn8sGp0a4nnrm+ZtpjtPX181nBVStgTvE3xQm40opc
	OlQr54A
X-Received: by 2002:a05:6000:41cb:b0:48a:f511:e40a with SMTP id ffacd0b85a97d-48af511eb10mr783882f8f.34.1790662095984;
        Mon, 28 Sep 2026 23:08:15 -0700 (PDT)
Received: from localhost.localdomain ([62.56.221.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af4e8a332sm1628730f8f.0.2026.09.28.23.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:08:15 -0700 (PDT)
From: Michael Freidkin <freidkin@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: meson: vdec: size capture planes from the aligned canvas
Date: Tue, 29 Sep 2026 09:08:12 +0300
Message-ID: <20260929060812.2041099-1-freidkin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <artQxRR3kJUv-mBF@stanley.mountain>
References: <20260928165045.642354-1-freidkin@gmail.com> <artQxRR3kJUv-mBF@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 29, 2026 at 08:46:45AM +0300, Dan Carpenter wrote:
> Reviewed-by: Dan Carpenter <error27@gmail.com>
>
> It would probably be more reliable to just ALIGN() the width and
> height at the start so we don't have to do it over and over again.

Thanks for the review, Dan.

Agreed. I kept this one minimal so it backports cleanly with the Fixes
tag. If the maintainers prefer, I can send a v2 that aligns width and
height once in vdec_try_fmt_common() and derives bytesperline and the
plane sizes from them, or do that as a follow-up cleanup on top.

Michael
