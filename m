Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.251.234.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906354;
	b=Xv/JDTIO2Ws/019Wwi/hS4QC8T37LEFr/sfWxfEf3XZkydZjptXk442gjZaJk6/YV43f
	 CLRrlJeoToFqKLBZfJmmu77EROzWwCQobBh8hgY1lq4lFDblfyw6eBb7n9I1mSsSkS39B
	 pq3v6m00BZMeCQ2Qz1dMWVksBRj+DcqeaR1gxPqguSnVzj73QK3xedpANcPZOTUMGapdB
	 8B656MYr9gikTacvHKa4naw5jyeWuZZu9DnGkSC6Bqdp5FHn9E6JslGLUIN8Y8iibevrj
	 ecMVwAemokS0v6x+m/vdyDcYQJY0WFNfUUa8sOj+1HLQLkHUUg/1bD4UpebI+/RkSAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906354;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:In-Reply-To:References:
	 X-Mailer:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:
	 MIME-Version:Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=FOJbl8BO95im62DOG6agEqaoWrcZD8bJl1ZvYV/eIRw=;
	b=rda3Ax7zhzjWzLWeL3SHPmqXpkQauB43EDDYSPKXVUgQ2wC2q8qJYDx+u1HYbofPqNO6
	 ++L5ur51dowkWXY0vg8vMFaZVjDgDQy4buw3wVBU7blbDNW8eJEAMd3EbDnVXTJCR+Hcg
	 16yD1rV7Ti3BzbmQeM2c3Sfy9vPn8WvMIDSP3FlHSv+VTTNFAS5z5zdB0nT6qthsle0wR
	 nZrn2eGd8+D6Kg4Ot1XEACfxJu5+4u05QFf/9TnPwpuYBatfNYnXkTs/NLpis+1B1kd1n
	 UvUyMnzz7+qMzlTwtJu8cQDynCNAQhHr0jy2+OCDxuI5YWDbBqTjzrTe9DTJOtXQ++w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fqwqf.xyz;
	spf=pass smtp.mailfrom=send.fqwqf.xyz;
	dkim=pass header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=RkTx8lp9;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=Act2Ps+u;
	arc=none smtp.remote-ip=23.251.234.50
Received: from e234-50.smtp-out.ap-northeast-1.amazonses.com (e234-50.smtp-out.ap-northeast-1.amazonses.com [23.251.234.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B10606A32D
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 19:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9B10606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=RkTx8lp9;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=Act2Ps+u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1793906353;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=hbAA1tC9xIBP6Lh1fJ8x8vijjAijX30HS/nt2gBNXvw=;
	b=RkTx8lp9107GTL3Pl1F2wRvayPtvOu3HHXYeuDXkJ5ofggvCr8S/7FfoG3xhE3jY
	XalmCQL9sIuvaBrXjRjltYcFViakzkl+dnf6Lu0NrEHtOgDCuiw88vWSOKkYQP2ALD/
	jwyOGkPbglrdqgDC1YzyblpDVKVsJXsRmhQyEev4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1793906353;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=hbAA1tC9xIBP6Lh1fJ8x8vijjAijX30HS/nt2gBNXvw=;
	b=Act2Ps+u2cbhflwZy4AWFm1OAawjjO7C42Njoy1/8pgpg1uU9o6sVhzIA4d2v0Nu
	jfrGDlxb/1XP+UPYTVMHSLP58K8xuGE+MbmUu1+HIc1qPEgxDmtb9HmejAdBCG7nCKF
	VMVBCyTtUC/AMXmSwac8RRCmdjiGSjLvxBJv2aXc=
In-Reply-To: <20261103103235.94397-3-lsa.uz@pm.me>
References: <20261103103235.94397-3-lsa.uz@pm.me>
X-Mailer: git-send-email 2.53.0
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: sakari.ailus@linux.intel.com, benjamin.mugnier@foss.st.com, 
	sylvain.petinot@foss.st.com, hansg@kernel.org, mchehab@kernel.org, 
	linux-media@vger.kernel.org
Subject: [PATCH] media: i2c: vd55g0: register through the sensor helper
Message-ID: <010601a1ad26a461-7000cf48-b14a-45dc-b2bf-7b3fd5d81aef-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: 7bit
Date: Thu, 5 Nov 2026 19:19:13 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.11.05-23.251.234.50

The plain async subdevice registration function does not acquire the
privacy LED described by firmware. Consequently, a board can provide
leds and led-names = "privacy" without the V4L2 streaming helpers ever
being able to switch that indicator on.

Use v4l2_async_register_subdev_sensor() to acquire the privacy LED and
register the sensor's firmware associations. The helper releases its
resources on registration failure, and v4l2_async_unregister_subdev()
already releases them on removal.

Signed-off-by: Jizhou Tong <fqwqf@fqwqf.xyz>
---
Hi Sergey,

While preparing to test your driver on the Surface Laptop 7, I noticed
that the registration path skips privacy LED acquisition. My board
describes a white camera indicator through leds/led-names. This increment
is against v2 2/4 and is separate from the three v3 updates you described
in your November 3 follow-up.

The driver builds with W=1 on ARM64 after adapting the two unused
client-info parameters and their internal call to my older local V4L2
pad API. That compatibility change is not part of this patch. I have
not run this standalone driver on the hardware yet.

 drivers/media/i2c/vd55g0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/vd55g0.c b/drivers/media/i2c/vd55g0.c
index 3b51a87e74..298fdc1b3d 100644
--- a/drivers/media/i2c/vd55g0.c
+++ b/drivers/media/i2c/vd55g0.c
@@ -2350,7 +2350,7 @@ static int vd55g0_probe(struct i2c_client *client)
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
-	ret = v4l2_async_register_subdev(&sensor->sd);
+	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
 	if (ret) {
 		dev_err(&client->dev, "async subdev register failed %d\n", ret);
 		goto error_pm_runtime;
-- 
2.53.0

