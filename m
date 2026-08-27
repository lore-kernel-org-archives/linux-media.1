Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AF4388393
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 04:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787804801; cv=none; b=J7b285VrXU54Fdw2UL/y5iLCvmyXWHWb2AfzBokeMCct3gFsWMH1SjHUIlV10MU1ANwi/aoIAC49TTC4ZWPh7d+4mofdzOVVgu73PGtmJkp2MpRWn3t7Bj6xrVu4CNHjf6MCzzfQKdnKDeCJMjotjgSFN8bMr3iEO6cp3st77ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787804801; c=relaxed/simple;
	bh=wpkEA3uwodU/PU3/gbkkjbA9WUXgO3SwzfpC2pZp1bs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jV9boQmETj1S6aCRmDgAykAsKvU2lIXrO3GlHhCPtFuu6AxBsJkwrmTHh2zllGeS9wCR8f2RI8pel+O8+JfqQs79zdpgiBaTFIP2x+Gub58fmfnWgJ6JWvq0Gm+KydI1Df6NogOlpJOH2fUP3Ob/fQ4tqCd5C7LZfdltBeXFAJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cG4q7Use; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cG4q7Use"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d72ae08fa1so2461775ad.2
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 21:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787804799; x=1788409599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fsygry22qQnjiHZyuRcED7KjHJNfEol8psEK33LfexU=;
        b=cG4q7Use9xAv/AYHKCU96p0CINjC1VGAG52qp6dW0w3WMr26CCL3RxGCR/NI+3pcqS
         sz9zCy3XCRIt48wDM8gByJFSNTYSx4F18X6JGOLUNej2jHB6cu9bC9afThERno5E3ErJ
         lsAgJdmpa9JKXQbdGUNpDmx51GH4K5B+ONBmSNWX3qAWY0wgQBp1Sz7nRdMl7RZkxmgA
         p36FOPM0OCxjufjCXsPs7wJGxyP48TKoO/0Q1rV8s7MNLZe0ck3TTLXA2uwhRxxuRMOn
         W3PJDO9p5WtqJaktDHDVTQCJ9RgRbBIpb8QczxRxiocXNg8D79yr7CJ7EkLkxNPCGmK/
         HzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787804799; x=1788409599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fsygry22qQnjiHZyuRcED7KjHJNfEol8psEK33LfexU=;
        b=VxxMD4DAMSZ2XCHAdRV0SJ7OjCews1dFq9V0NUcxDZX+ZgU3juSE2/C/FDFPtgMeXs
         VAg6pEB9DM9K3Db2g0dqFezyhaZcK17/3hr3/2l7iash8e8HjZJwL3Eqj4z3/2yK/nhF
         /scRTHEiq8HFDZ59KXpzi9sDR/vOqN5u2JN9ZFb8Vq+b6fbmgxKb27GOPgCQ/ox5Y8sx
         OyvEyPIfaJgsHBtwMdlpxZBR2LLVKNj9Gt6MkU1Dntc/blWFO205gBL35u5OBsg5Ears
         /LQElooKwU4SPrLpoZ4kxblqyrJU4OksKuh/Nro2s+oRVQk5tsCzZwAEKtMUM0qsGtak
         c+PQ==
X-Forwarded-Encrypted: i=1; AHgh+RqD/CWBpKRu+kZg+VSpQa1JQ/zlAtElIj87BvbCEHq3Lzrxhn9QrW9l3UKRMiVjU7iLBdKNKgZk1jtqcQ==@vger.kernel.org
X-Gm-Message-State: AFuF++msCCip7XY6pi7S+EKu0FAjvRdCUyESl0HUntz8+ODdj3rDvoVY
	Cyur/WygxP9KJ5UIr/jHFAV312RVTiodQ5zbh8mtbMG9g8HijpxugWsp
X-Gm-Gg: AR+sD10zJRIQtfXcSwy240gLB2jCbTi0i8Gx0X+R1VmIzk+S7Pdpc4fMrUD+kThMB0Q
	uhjH/e+tq+Qy/Vzpph1pY0R+UBCjqve+Ql3rmP9iChmBdy5jXi8Bi+TK1dw21IUmTshcm4IA8ww
	8hs3Dh193mOjYG36rCDiRKn15tD8GOzDVdMHfdQj94ZPQHlQjt91Q2oM0nQlYWVJP5hYF/zY7H2
	MpvmnAeuw3soBCmDvnnl5j3K4Il0bEeltDGSKj6Ws5DB2PNTIkOa4kqeprRUwCQO1H1cl+raOc6
	w5cLGVGLyI0OmhhQB1J37Ae+zLnX4SMUaED2Zs0vg8Qah6OtnYXsKrppVAo6Pu4q81ubbPKlG1p
	BE2I9Zx07gkCpb8FWd0xIB/CRJjovjT+kP8O15uWRNWVGHq4Ryms/zPZh5Y9YSUuTpWewtPhAiY
	wrBpJBDSfBgnKf+egc3/JgrtxOum7Dxx/hgjiY+c5n7duTGOWOoHRz0NN//ESL4ohFvg==
X-Received: by 2002:a17:902:e550:b0:2ca:1479:d9dc with SMTP id d9443c01a7336-2d707b64aecmr219904355ad.12.1787804799444;
        Wed, 26 Aug 2026 21:26:39 -0700 (PDT)
Received: from Default ([2409:40f4:1012:4330:756d:2890:a615:2db9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d8d208csm13662685eec.23.2026.08.26.21.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:26:39 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: jeffinphilip14@gmail.com
Cc: dwlsalmeida@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	stable@vger.kernel.org,
	syzbot+c7fc4794e59786f5b4dc@syzkaller.appspotmail.com
Subject: Re: [RFC PATCH] media: vidtv: fix uaf in vidtv_bridge_on_new_pkts_avail
Date: Thu, 27 Aug 2026 09:56:15 +0530
Message-ID: <20260827042615.12777-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827042229.12561-1-jeffinphilip14@gmail.com>
References: <20260827042229.12561-1-jeffinphilip14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>Attempting to unbind a dvbdevice that is in the process of feeding
>data causes a UAF as we free the underlying device without
>stopping the feed first. Fix this by stopping the stream first using
>vidtv_stop_streaming(). However, our codepath in the reproducer
>(mentioned in the below reply) does not decrement our users
>(dmxdev->dvr_dvbdev->users) to 1 after it has been incremented to 2
>by our read() in the reproducer, that is only possible on .release.
>This can cause a task hang as dvb_dmxdev_release() uses wait_event()
>in the wait_queue unless we use a close(fd)(in the reproducer).
>Is this a problem? Please advise.

Reproducer:

#include <fcntl.h>
#include <unistd.h>
#include <pthread.h>
#include <linux/dvb/dmx.h>
#include <sys/ioctl.h>

static void *feed_thread(void *arg)
{
    int i = 100;
    int fd = open("/dev/dvb/adapter0/demux0", O_RDWR | O_NONBLOCK);
    struct dmx_sct_filter_params params = {
        .pid = 0,
        .filter = { .filter = {0}, .mask = {0} },
        .flags = DMX_IMMEDIATE_START,
    };
    ioctl(fd, DMX_SET_FILTER, &params);
    char buf[188];
    read(fd, buf, sizeof(buf));
    //no close(fd) here
    return NULL;
}

int main(void)
{
    pthread_t t;
    pthread_create(&t, NULL, feed_thread, NULL);
    sleep(1);
    int fd = open("/sys/bus/platform/drivers/vidtv/unbind", O_WRONLY);
    write(fd, "vidtv.0", 7);
    pthread_join(t, NULL);
    return 0;
}

