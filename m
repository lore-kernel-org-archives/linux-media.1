Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C7547F786
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 10:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790937087; cv=none; b=aBs1LxNgvupgCtorVPg64AXBKPims2WFG1FxyRaHpj1b4JG9MZFCUa7JOBzf8oTkNExMPPo/ym7XKv17444OS/IRqPXSwAI/MFeXqI4T/8wSDzIcdl3lhU39VBmD9ZOynQFcxAyGborugQ4ZLt/vC/uoNDHpj6ZvC23WKh9Qc2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790937087; c=relaxed/simple;
	bh=ET/jfY1QDBHadWDOICZziU2PCIlyAJkvZj8XAZZ/VIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aN0zGHbIjOMHV+uG8vKVfQmbTYXVEgHMJIOvzGkk3sCpoqdxM3WBxlOMrYlBCkUTgqRJZG9sNx8wqVYZHQpVbnYym8VzaZE6TOOm1jVLAKM/VVv46IYZ6vqE6HGThzF4TYTf/VRH6m6D1Bxktyn8h2pMW/TyONuSPz0FJF8s9jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNe9M+HS; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNe9M+HS"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e0f2c945eso424216966b.3
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 03:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790937079; x=1791541879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DqWtIxL1q2DAFBIqqs5rpBBSEMrGutL9XsqSKxpq+O0=;
        b=jNe9M+HShYuMzOxrZoyOZ4mXft+hE08k/tW8tvTVJojqDxF7PZ9pjEnIw70StI/Jva
         JcBM/ncz4pcAdeAamtVpWBUHpwJZUZbc7g6tEaP1Lxij1yqmueyvwLWRKWWaWMlS7FsT
         f1nAFEQ7GTDGPGEKVzTS2ax8+McSevDZJcPoi4vOLwF390knik7kwFFOZDuSMAcZj7tT
         i56OqGnFujcNf73rX5e1GOUU8nRxrxo9URhtNUje1vpnP94m6WJsVL+lVXr0NPGVgaS1
         D+VXV07y/V9jfLx73W/mIbFOZ0c58CZVZh/2mkRwSbse3gN651JnL/PBYtYu9TpRjLS7
         tbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790937079; x=1791541879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DqWtIxL1q2DAFBIqqs5rpBBSEMrGutL9XsqSKxpq+O0=;
        b=fL2NDPCOrObVwKFqCxINi6lfEZ6OpaQLX+PVFiXubvxkEDA9yc0DudJq5bHg5duaBt
         Be/qdn4yn6OtHtjJ4b0C1B6QASZn/aSSqItzyLPCABhMscuXU87wod2yJcatJW0zBVpV
         y8zIO5E47qWFbBZyxjMKAPAvTJ2xGutsti+HfkEBl22s64MmkGrOpcVTaMfHaz8ah0HG
         sC4GwJIhuYmU1r+qMT1vBYsFoCFXGsQaXZxx2Ef/V99wjfaodelp43EzTuCwe+nxAdH8
         vc8m22hipdAWRyCml6P81NM2hCr5kUvn799ythgQps3iXH75hVRH/oqbMPLXoiIqVLZb
         nT7w==
X-Gm-Message-State: AFuF++mmBQ7XoevGbOJbnBwBUx6b8rWz0mREF83Ep/9kZ8LgjQYZN93d
	E8MRO7yBIP/qgUe7TmRDZAE/55um7mhR8kmvJLIUp5X17AXp06+T1AFm53fXpyHZnyNTNw==
X-Gm-Gg: AYBFou0wkov2oVefeoiunUoz1XzR47KOFoUDz9zzt9BeHZVnciYoSYXoAflILctqgJQ
	AFKHwZxSiSfkmfxXe6058J3PySUzO/LsPZsj8JuqWejPrxtr+Fe4oLi/EXYleZ/8qqungVc3OZN
	aYPX2qa5Vbuk2VRh3a9U9qg+JbiZz09ZuHH3MyTUC5G/l+Ffbxa88FMn1MriUktOrWCskz0224L
	oBK4i0tB/dUU10teI//WpzEVZ39CzY7uyb6H9i8Oo3mjkGi9LgvGsShTglEdHb4m3ZvBHWTbWLt
	lnM0+hvfah2f0YOBrCvmJl8R0ouL9xoi0sTEep6D6MU4pQPz8qfobVG9+UABOL3g3qK1qxxFoMi
	sE02IX0MzYN9bvpdejVOpLt2xt0V6JZPD9tFTvnmuuR9XgUpE3TUfM/4iMA86U7/lHfOExATR42
	NAWaecuMruRTtEze6UqawEUnbcQHj7+t90ntVPYj+ud9aSjBOy2bozUcdi2MwPhXUGj8g=
X-Received: by 2002:a17:907:e1ce:10b0:c2a:ad68:c70e with SMTP id a640c23a62f3a-c2e5c0525d6mr62225766b.11.1790937078494;
        Fri, 02 Oct 2026 03:31:18 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf85881sm74359966b.56.2026.10.02.03.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:31:17 -0700 (PDT)
Date: Fri, 2 Oct 2026 13:31:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH v7 02/16] media: ov8858: support 19.2 MHz clock and CHT
 gain setup
Message-ID: <ar-H8g9RnhujCvyk@stanley.mountain>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
 <628adb1cabec866554ca26a2da5af860b04d6cb1.1788360629.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <628adb1cabec866554ca26a2da5af860b04d6cb1.1788360629.git.mauriziocasciano7@gmail.com>

On Wed, Sep 02, 2026 at 04:53:31PM +0200, Maurizio Casciano wrote:
> Link: https://lore.kernel.org/linux-media/apf7cJOoXrl_wZfr@kekkonen.localdomain/
> Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
> Assisted-by: LLM [Codex] [Sparse]

Gmail keeps blocking my replies to this thread.  Perhaps the CC list
was too long?  I have shortened it.

What was the exact Sparse warning here?

regards,
dan carpenter

