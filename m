Received: from mail-qv2-f10.google.com (mail-qv2-f10.google.com [74.125.230.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2960A485958
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 12:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043717; cv=pass; b=fM6dnwuYmoucpVF4mr6p5Qw0EE0yvQRdY/hM6drWyBF7EZmdqQhluCGEGeemYxaquFvSnnGKRx5xnGsqOKWc7hQBVOrxyWbTA/63SLojS/HPTiOWH8Ni/los0X+JmaRtzsVsDSfb+jYxs778B1EKD9O86PvRHwSlFYy3R/6yVpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043717; c=relaxed/simple;
	bh=740PG6VFKyPm9mOVeYNV9PT6A7cPlSOyC5KqxJrMMtY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=EZ/6QNcYS22v6kKc+vgHtmbi0/Ix6BvqV0LpRyUD1NejUUTPHBhk4nBvSGGeLl+WlVKfuXzmybmf0IImLq/2EO3oVYaGdTBa134/bQCNtDAM9izMn5nfHbla6EhSA3wnJUsw+NC4KYCB1zhqKk/a6b0yvs/ITMD4gzkFAV5L+M0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUwpgX/f; arc=pass smtp.client-ip=74.125.230.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUwpgX/f"
Received: by mail-qv2-f10.google.com with SMTP id 6a1803df08f44-90e8598dda2so68012116d6.0
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 05:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789043715; cv=none;
        d=google.com; s=arc-20260327;
        b=I7V7/GZSwFD88uBi7czV0TMR9macqRKWkIjo5MzFBE+GeTaGkqFq/DWK7mLt9+r7cs
         2MTBpfqRyEvwr3lY9Ky8E2lqarGhF5IZbSHodE0aXwGh+a8GEwWE+/pvinbxmeCNsDy7
         SaRsI53laLvLKYN/Zk2D6YzZ1omzFytoSyunr4MxLSioa265+tI04W2NXbAhh7hLihpa
         Q6g38BeotGM50qgs5Xwqt6L2ioyTzvwlvhZvymoPJtR0cnySYJOj8N9N6sBVh/hhs1+O
         csvimH6Z1kL71GK5WsgNXNIGnTxj/LLLY+Q9upS9JvHv0Y+1rkez9bS1/d4grLOH9uXD
         TT/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=HA01Oq6SRJ4lwTENlmUeyoBtKnEOjB/LBv1DzGiCwoY=;
        fh=NgaTrv+jl2HyW43UZ/M51d2xwIxZv4832gPUm+WmDJU=;
        b=nrlEXaGDOIJlrMv0uSldsFGnjc+QEZALgUx82Wsl0Xnw935SHpThGuMNtrwXWIuhTC
         EKQz1fwLObjAjDAs4yCTdXuu5wFwfw1H/wNX4AE/lBwdVwxIMLC7E51iGWk3q7HzCG3X
         vw4zYnHtgyihXQZFy0tknviRDBvS0VxL5UjdRPDb+GcWSWSSl1LeCUc22oqwkamOxDlq
         BGtCRcl/Li9nEyPjwfacm0qp4PAz6f+MMKAMpr7qHTO4zAVNyDn4dkTGn4QM1dKfO1uQ
         TnDMJvEPRN/ECZsDfH/0puy4D74gJsQDaAjJ845Yw65KrziOZsIeX+80JL1SiDo7WJSC
         s1Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789043715; x=1789648515; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HA01Oq6SRJ4lwTENlmUeyoBtKnEOjB/LBv1DzGiCwoY=;
        b=fUwpgX/fISsxBZVSCylpAwVQdUx8ZXGAe1GkoyMcWNAbxPxF5Ym+/cm0Kpgc/SRZBs
         yw4EPjbXUY0OwBuDSKHt60M20XFLBEAqfxGMbYUVTvxAVYBWdqB1H8q02VaTaSSfNrFR
         wYlZaPqZ+nEmuChwbSA5ExYcORXCEw4mIfNV57oXqjhhF4OoegMi6Z/b0cR/M3nErzCU
         J5b9GWtnZWhe4aeAWV3Y0hIp+rI8nejdGqNxJDEFgSJNNCNYaGJgozdgjixYopb1fXGT
         +/hg6gxhfm/aJBimNQJsAKlEa+y8He9BsWw3fhhARHa3zLQ8MMZc+zZrJeUKA7IkucVg
         o10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789043715; x=1789648515;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HA01Oq6SRJ4lwTENlmUeyoBtKnEOjB/LBv1DzGiCwoY=;
        b=BaeyocAX4yGrKeTxZc73gj5QRNOqLNkPUeN4FRyY7anYZeFPlneV5lYxVHLBmuOivA
         iRRYQW1OvFT7XdyANcjcV19gk6UFHPM7iyV+yOKm2EUz5xVAfuJgwb5s4rohCZHL64bb
         kIcnU9nCgyx3yUfjWTpu/oSVrqwNgxJsV1Mf017Kv80MQGHD/k8JxUOL8ctd++KIqghD
         vzKwvfFmkD6aG1NJs8aI8xceRENpBIjGLYi9Ay89tbn/i3gpulF1kDUK+NIomX/9GE63
         vBFsiuwD4Yk7mnnlxejPoGeQ1PSwtt/NKYrgK6dAtC0uHVTkIf5KNP/UCbkuGlVlRWtI
         soPw==
X-Gm-Message-State: AFuF++mtQgY2CNCtE76RLnzm5zdoL3zrNqkSQK2M5Kkr9+6VYc0x1lls
	sjT2qSzLk1QKF/rGNOELoJiBJD3qNfMQqIxRAVS3Sx4i1C/HjRb6Ehr+b2ESrDXdxPdAkrEsKYY
	beKaFpUWHiJetHtpnKXQdLR5EKmdf14k=
X-Gm-Gg: AYBFou35TiWpa/IaClqQzlRc826mu8JYG3UX4SQYFi2/OiFVsBI1eO5Re1pMnT1hNql
	dwe+u3KG2qgBX0NNdbTNkQUbVmkQWhdlBS48rwSxpVvqyuz+Mme36jR3z+7dy5MRnxpxFACjKaT
	Hzl+E0rR2a7zQhcm/4YkQXaFnXSK00IeiJpjC5SsUF8vmBwFTqTshLFZBw8/pc1XC+LBlplqN2c
	PRezLyvTwtE1QjPoTmA699/QYd6lCtZU3jWAH6TbQ/Vq4UnQQFZMsustfbh0Bvqs5hOEi4kV5Ul
	maq+/FX5ta3ns2q22jysCC5EGZXcbX79jrBXhAeTeOF3urdRqemR8MRrJt/KNQNoSquk1H93Pd2
	ILWrTic7nzbUnnoYzUtUIhfaqVirtU00p3n2DhcPVRM0LJRddMd0lyo3QUXVTE3yH2K7ZdskFly
	2i6xs=
X-Received: by 2002:ad4:5746:0:b0:8ef:1fc9:935b with SMTP id
 6a1803df08f44-9103ef1719dmr548161946d6.12.1789043714740; Thu, 10 Sep 2026
 05:35:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: www.rokinthanp03@gmail.com
From: Rokinthan p <rokinthanp03@gmail.com>
Date: Thu, 10 Sep 2026 18:04:57 +0530
X-Gm-Features: AcwNN1UqGnGvy3p6P_NdEirj7lRsRAxftX-S958muel5EKU2asSh4DXSVZTHCtw
Message-ID: <CAHzb5FFjW7+PxPWWbfDXeVpaCdOurPbY6B44mE6WNjNSbt7K9g@mail.gmail.com>
Subject: [PATCH v2] media: hackrf: defer v4l2_ctrl_auto_cluster() until after
 error check
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cf896de36144391bcde1@syzkaller.appspotmail.com, 
	syzbot+9f7405999979761b6cfc@syzkaller.appspotmail.com
Content-Type: multipart/mixed; boundary="0000000000001b55c8065b20330d"

--0000000000001b55c8065b20330d
Content-Type: text/plain; charset="UTF-8"

In hackrf_probe(), v4l2_ctrl_auto_cluster() is called immediately after
    allocating the auto and manual bandwidth controls for both the receiver
    and transmitter.

    If allocating the master control (dev->rx_bandwidth_auto or
    dev->tx_bandwidth_auto) fails, e.g. due to memory allocation failure,
    the pointer is NULL and the error is recorded in the control handler.
    Calling v4l2_ctrl_auto_cluster() with a NULL master control causes
    v4l2_ctrl_cluster() to trigger a WARNING:

      ncontrols == 0 || controls[0] == NULL
      WARNING: drivers/media/v4l2-core/v4l2-ctrls-core.c:2525 at
  v4l2_ctrl_cluster

    Fix this by moving the v4l2_ctrl_auto_cluster() invocations down after
    checking dev->rx_ctrl_handler.error and dev->tx_ctrl_handler.error.
    If control allocation fails, probe cleanly aborts with an error without
    attempting to cluster NULL controls.

    Fixes: 81774395a8d9 ("[media] hackrf: new driver")
    Reported-by: syzbot+cf896de36144391bcde1@syzkaller.appspotmail.com
    Closes: https://syzkaller.appspot.com/bug?extid=cf896de36144391bcde1
    Signed-off-by: Rohinthan <rokinthanp03@gmail.com>
    ---
    v1 -> v2: Fix email indentation and whitespace corruption from initial
  submission.

     drivers/media/usb/hackrf/hackrf.c | 4 ++--
     1 file changed, 2 insertions(+), 2 deletions(-)

    diff --git a/drivers/media/usb/hackrf/hackrf.c
  b/drivers/media/usb/hackrf/hackrf.c
    --- a/drivers/media/usb/hackrf/hackrf.c
    +++ b/drivers/media/usb/hackrf/hackrf.c
    @@ -1427,7 +1427,6 @@ static int hackrf_probe(struct usb_interface *intf,
         dev->rx_bandwidth = v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
             &hackrf_ctrl_ops_rx, V4L2_CID_RF_TUNER_BANDWIDTH,
             1750000, 28000000, 50000, 1750000);
    -    v4l2_ctrl_auto_cluster(2, &dev->rx_bandwidth_auto, 0, false);
         dev->rx_rf_gain = v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
             &hackrf_ctrl_ops_rx, V4L2_CID_RF_TUNER_RF_GAIN, 0, 12,
12, 0);
         dev->rx_lna_gain = v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
    @@ -1439,6 +1438,7 @@ static int hackrf_probe(struct usb_interface *intf,
             dev_err(dev->dev, "Could not initialize controls\n");
             goto err_v4l2_ctrl_handler_free_rx;
         }
    +    v4l2_ctrl_auto_cluster(2, &dev->rx_bandwidth_auto, 0, false);
         v4l2_ctrl_grab(dev->rx_rf_gain, !hackrf_enable_rf_gain_ctrl);
         v4l2_ctrl_handler_setup(&dev->rx_ctrl_handler);

    @@ -1450,7 +1450,6 @@ static int hackrf_probe(struct usb_interface *intf,
         dev->tx_bandwidth = v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
             &hackrf_ctrl_ops_tx, V4L2_CID_RF_TUNER_BANDWIDTH,
             1750000, 28000000, 50000, 1750000);
    -    v4l2_ctrl_auto_cluster(2, &dev->tx_bandwidth_auto, 0, false);
         dev->tx_lna_gain = v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
             &hackrf_ctrl_ops_tx, V4L2_CID_RF_TUNER_LNA_GAIN, 0, 47,
1, 0);
         dev->tx_rf_gain = v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
    @@ -1460,6 +1459,7 @@ static int hackrf_probe(struct usb_interface *intf,
             dev_err(dev->dev, "Could not initialize controls\n");
             goto err_v4l2_ctrl_handler_free_tx;
         }
    +    v4l2_ctrl_auto_cluster(2, &dev->tx_bandwidth_auto, 0, false);
         v4l2_ctrl_grab(dev->tx_rf_gain, !hackrf_enable_rf_gain_ctrl);
         v4l2_ctrl_handler_setup(&dev->tx_ctrl_handler);

--0000000000001b55c8065b20330d
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-media-hackrf-defer-v4l2_ctrl_auto_cluster-until-afte.patch"
Content-Disposition: attachment; 
	filename="0001-media-hackrf-defer-v4l2_ctrl_auto_cluster-until-afte.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mtviewbm0>
X-Attachment-Id: f_mtviewbm0

RnJvbTogUm9oaW50aGFuIDxyb2tpbnRoYW5wMDNAZ21haWwuY29tPgpTdWJqZWN0OiBbUEFUQ0gg
djJdIG1lZGlhOiBoYWNrcmY6IGRlZmVyIHY0bDJfY3RybF9hdXRvX2NsdXN0ZXIoKSB1bnRpbCBh
ZnRlciBlcnJvciBjaGVjawpEYXRlOiBUaHUsIDEwIFNlcCAyMDI2IDE3OjU1OjAwICswNTMwCgpJ
biBoYWNrcmZfcHJvYmUoKSwgdjRsMl9jdHJsX2F1dG9fY2x1c3RlcigpIGlzIGNhbGxlZCBpbW1l
ZGlhdGVseSBhZnRlcgphbGxvY2F0aW5nIHRoZSBhdXRvIGFuZCBtYW51YWwgYmFuZHdpZHRoIGNv
bnRyb2xzIGZvciBib3RoIHRoZSByZWNlaXZlcgphbmQgdHJhbnNtaXR0ZXIuCgpJZiBhbGxvY2F0
aW5nIHRoZSBtYXN0ZXIgY29udHJvbCAoZGV2LT5yeF9iYW5kd2lkdGhfYXV0byBvcgpkZXYtPnR4
X2JhbmR3aWR0aF9hdXRvKSBmYWlscywgZS5nLiBkdWUgdG8gbWVtb3J5IGFsbG9jYXRpb24gZmFp
bHVyZSwKdGhlIHBvaW50ZXIgaXMgTlVMTCBhbmQgdGhlIGVycm9yIGlzIHJlY29yZGVkIGluIHRo
ZSBjb250cm9sIGhhbmRsZXIuCkNhbGxpbmcgdjRsMl9jdHJsX2F1dG9fY2x1c3RlcigpIHdpdGgg
YSBOVUxMIG1hc3RlciBjb250cm9sIGNhdXNlcwp2NGwyX2N0cmxfY2x1c3RlcigpIHRvIHRyaWdn
ZXIgYSBXQVJOSU5HOgoKICBuY29udHJvbHMgPT0gMCB8fCBjb250cm9sc1swXSA9PSBOVUxMCiAg
V0FSTklORzogZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1jdHJscy1jb3JlLmM6MjUyNSBh
dCB2NGwyX2N0cmxfY2x1c3RlcgoKRml4IHRoaXMgYnkgbW92aW5nIHRoZSB2NGwyX2N0cmxfYXV0
b19jbHVzdGVyKCkgaW52b2NhdGlvbnMgZG93biBhZnRlcgpjaGVja2luZyBkZXYtPnJ4X2N0cmxf
aGFuZGxlci5lcnJvciBhbmQgZGV2LT50eF9jdHJsX2hhbmRsZXIuZXJyb3IuCklmIGNvbnRyb2wg
YWxsb2NhdGlvbiBmYWlscywgcHJvYmUgY2xlYW5seSBhYm9ydHMgd2l0aCBhbiBlcnJvciB3aXRo
b3V0CmF0dGVtcHRpbmcgdG8gY2x1c3RlciBOVUxMIGNvbnRyb2xzLgoKRml4ZXM6IDgxNzc0Mzk1
YThkOSAoIlttZWRpYV0gaGFja3JmOiBuZXcgZHJpdmVyIikKUmVwb3J0ZWQtYnk6IHN5emJvdCtj
Zjg5NmRlMzYxNDQzOTFiY2RlMUBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCkNsb3NlczogaHR0
cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlkPWNmODk2ZGUzNjE0NDM5MWJjZGUx
ClNpZ25lZC1vZmYtYnk6IFJvaGludGhhbiA8cm9raW50aGFucDAzQGdtYWlsLmNvbT4KLS0tCnYx
IC0+IHYyOiBGaXggZW1haWwgaW5kZW50YXRpb24gYW5kIHdoaXRlc3BhY2UgY29ycnVwdGlvbiBm
cm9tIGluaXRpYWwgc3VibWlzc2lvbi4KCiBkcml2ZXJzL21lZGlhL3VzYi9oYWNrcmYvaGFja3Jm
LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS91c2IvaGFja3JmL2hhY2tyZi5jIGIvZHJp
dmVycy9tZWRpYS91c2IvaGFja3JmL2hhY2tyZi5jCi0tLSBhL2RyaXZlcnMvbWVkaWEvdXNiL2hh
Y2tyZi9oYWNrcmYuYworKysgYi9kcml2ZXJzL21lZGlhL3VzYi9oYWNrcmYvaGFja3JmLmMKQEAg
LTE0MjcsNyArMTQyNyw2IEBAIHN0YXRpYyBpbnQgaGFja3JmX3Byb2JlKHN0cnVjdCB1c2JfaW50
ZXJmYWNlICppbnRmLAogCWRldi0+cnhfYmFuZHdpZHRoID0gdjRsMl9jdHJsX25ld19zdGQoJmRl
di0+cnhfY3RybF9oYW5kbGVyLAogCQkmaGFja3JmX2N0cmxfb3BzX3J4LCBWNEwyX0NJRF9SRl9U
VU5FUl9CQU5EV0lEVEgsCiAJCTE3NTAwMDAsIDI4MDAwMDAwLCA1MDAwMCwgMTc1MDAwMCk7Ci0J
djRsMl9jdHJsX2F1dG9fY2x1c3RlcigyLCAmZGV2LT5yeF9iYW5kd2lkdGhfYXV0bywgMCwgZmFs
c2UpOwogCWRldi0+cnhfcmZfZ2FpbiA9IHY0bDJfY3RybF9uZXdfc3RkKCZkZXYtPnJ4X2N0cmxf
aGFuZGxlciwKIAkJJmhhY2tyZl9jdHJsX29wc19yeCwgVjRMMl9DSURfUkZfVFVORVJfUkZfR0FJ
TiwgMCwgMTIsIDEyLCAwKTsKIAlkZXYtPnJ4X2xuYV9nYWluID0gdjRsMl9jdHJsX25ld19zdGQo
JmRldi0+cnhfY3RybF9oYW5kbGVyLApAQCAtMTQzOSw2ICsxNDM4LDcgQEAgc3RhdGljIGludCBo
YWNrcmZfcHJvYmUoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGYsCiAJCWRldl9lcnIoZGV2LT5k
ZXYsICJDb3VsZCBub3QgaW5pdGlhbGl6ZSBjb250cm9sc1xuIik7CiAJCWdvdG8gZXJyX3Y0bDJf
Y3RybF9oYW5kbGVyX2ZyZWVfcng7CiAJfQorCXY0bDJfY3RybF9hdXRvX2NsdXN0ZXIoMiwgJmRl
di0+cnhfYmFuZHdpZHRoX2F1dG8sIDAsIGZhbHNlKTsKIAl2NGwyX2N0cmxfZ3JhYihkZXYtPnJ4
X3JmX2dhaW4sICFoYWNrcmZfZW5hYmxlX3JmX2dhaW5fY3RybCk7CiAJdjRsMl9jdHJsX2hhbmRs
ZXJfc2V0dXAoJmRldi0+cnhfY3RybF9oYW5kbGVyKTsKIApAQCAtMTQ1MCw3ICsxNDUwLDYgQEAg
c3RhdGljIGludCBoYWNrcmZfcHJvYmUoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGYsCiAJZGV2
LT50eF9iYW5kd2lkdGggPSB2NGwyX2N0cmxfbmV3X3N0ZCgmZGV2LT50eF9jdHJsX2hhbmRsZXIs
CiAJCSZoYWNrcmZfY3RybF9vcHNfdHgsIFY0TDJfQ0lEX1JGX1RVTkVSX0JBTkRXSURUSCwKIAkJ
MTc1MDAwMCwgMjgwMDAwMDAsIDUwMDAwLCAxNzUwMDAwKTsKLQl2NGwyX2N0cmxfYXV0b19jbHVz
dGVyKDIsICZkZXYtPnR4X2JhbmR3aWR0aF9hdXRvLCAwLCBmYWxzZSk7CiAJZGV2LT50eF9sbmFf
Z2FpbiA9IHY0bDJfY3RybF9uZXdfc3RkKCZkZXYtPnR4X2N0cmxfaGFuZGxlciwKIAkJJmhhY2ty
Zl9jdHJsX29wc190eCwgVjRMMl9DSURfUkZfVFVORVJfTE5BX0dBSU4sIDAsIDQ3LCAxLCAwKTsK
IAlkZXYtPnR4X3JmX2dhaW4gPSB2NGwyX2N0cmxfbmV3X3N0ZCgmZGV2LT50eF9jdHJsX2hhbmRs
ZXIsCkBAIC0xNDYwLDYgKzE0NTksNyBAQCBzdGF0aWMgaW50IGhhY2tyZl9wcm9iZShzdHJ1Y3Qg
dXNiX2ludGVyZmFjZSAqaW50ZiwKIAkJZGV2X2VycihkZXYtPmRldiwgIkNvdWxkIG5vdCBpbml0
aWFsaXplIGNvbnRyb2xzXG4iKTsKIAkJZ290byBlcnJfdjRsMl9jdHJsX2hhbmRsZXJfZnJlZV90
eDsKIAl9CisJdjRsMl9jdHJsX2F1dG9fY2x1c3RlcigyLCAmZGV2LT50eF9iYW5kd2lkdGhfYXV0
bywgMCwgZmFsc2UpOwogCXY0bDJfY3RybF9ncmFiKGRldi0+dHhfcmZfZ2FpbiwgIWhhY2tyZl9l
bmFibGVfcmZfZ2Fpbl9jdHJsKTsKIAl2NGwyX2N0cmxfaGFuZGxlcl9zZXR1cCgmZGV2LT50eF9j
dHJsX2hhbmRsZXIpOwogCi0tIAo=
--0000000000001b55c8065b20330d--
